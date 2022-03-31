// ignore_for_file: deprecated_member_use, prefer_final_fields

import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // ignore: non_constant_identifier_names
  String _totalAmmount = '0';
  List<dynamic> _food_objects = [
    {
      'id': 1,
      'food': 'Rice with hotdogs',
      'image': 'rice_w_h.jpg',
      'price': 34
    },
    {
      'id': 2,
      'food': 'Rice with potatoes',
      'image': 'rice_w_p.jpeg',
      'price': 34
    },
    {
      'id': 1,
      'food': 'Rice with hotdogs',
      'image': 'rice_w_h.jpg',
      'price': 34
    },
    {
      'id': 3,
      'food': 'Rice with nothing',
      'image': 'rice_w_n.jpeg',
      'price': 34
    },
    {'id': 4, 'food': 'Rice with chilli', 'image': 'rice_w_c.jpg', 'price': 33},
    {
      'id': 5,
      'food': 'Rice with tomato source',
      'image': 'rice_w_t.jpeg',
      'price': 34
    },
    {
      'id': 5,
      'food': 'Rice with tomato source',
      'image': 'rice_w_c.jpg',
      'price': 34
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        Column(
          children: [
            // 1. for image in header
            FittedBox(
                fit: BoxFit.fitWidth,
                child: Image.asset(
                  'assets/images/bg_image2.jpg',
                )),
            // for food listing
            Container(
              alignment: FractionalOffset.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton( onPressed: () {
                    
                  }, child: const Icon(
                    Icons.arrow_back_ios_rounded, color: Color.fromRGBO(0, 0, 0, 0.8)
                    ),
                  ),
                  const Text(
                    'My Basket',
                    style: TextStyle(
                        color: Color(0xFF2E3233),
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                ],
              ),
            ),

            Column(
                children: _food_objects
                    .map((element) => Card(
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    color: Color.fromARGB(255, 49, 45, 45),
                                  ),
                                  child: Image.asset(
                                    "assets/images/${element['image']}",
                                    width: 70,
                                    height: 70,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  Text(element['food'].toString(),
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  Text("K" + element['price'].toString(),
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ],
                          ),
                        ))
                    .toList()),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 12.0, bottom: 12.0),
          child: ElevatedButton(
            onPressed: () {
              // ignore: avoid_print
              setState(() {
                _food_objects.map((e) => _totalAmmount + e['price']);
                _food_objects[0]["food"] = _totalAmmount;
              });
            },
            child: const Text(
              'Complete Order',
              style: TextStyle(fontSize: 30),
            ),
          ),
        )
      ],
    )));
  }
}
