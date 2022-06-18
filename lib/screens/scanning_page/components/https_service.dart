import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:http/http.dart' as http;
import 'package:veganic_foods_app/screens/details_page/details.dart';
import 'package:veganic_foods_app/widgets/error_pages.dart';

import '../../details_page/components/product_class.dart';

class Httpp extends StatefulWidget {
  final String? id;
  const Httpp({Key? key, required this.id}) : super(key: key);

  @override
  State<Httpp> createState() => _HttppState();
}

class _HttppState extends State<Httpp> {
  late final Future<Product> _future = _getdata(widget.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: _future,
          builder: (context, AsyncSnapshot<Product> snapshot) {
            if (snapshot.hasData) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                case ConnectionState.done:
                  SchedulerBinding.instance!.addPostFrameCallback((_) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Details(
                                  product_id: snapshot.data!.product_id,
                                  category: snapshot.data!.category,
                                  name: snapshot.data!.name,
                                  quantity: snapshot.data!.quantity,
                                  price: snapshot.data!.price,
                                  description: snapshot.data!.description,
                                  image: snapshot.data!.image,
                                )));
                  });
                  break;
                case ConnectionState.none:
                  return Notfound(
                      'something went wrong, please check your internet connection');
                default:
                  return Notfound('oops somthing went wrong');
              }
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}

const String postUrl = "http://192.168.40.82:8000/products";
Future<Product> _getdata(String? id) async {
  String url = postUrl + '/$id';
  var res = await http.get(Uri.parse(url));
  if (res.statusCode == 200) {
//==================================================================
    Map<String, dynamic> productMap = jsonDecode(res.body);
    var products = Product.fromJson(productMap);
    return products;
//====================================================================
  } else {
    return Notfound('please check your internet connection');
  }
}
