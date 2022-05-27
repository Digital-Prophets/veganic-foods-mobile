import 'package:flutter/material.dart';
import 'package:flutter_number_picker/flutter_number_picker.dart';
import 'package:veganic_foods_app/screens/details_page/components/product_class.dart';

class ListWidget extends StatefulWidget {
  final Product product;
  final Animation<double> animation;
  // final int quantity;
  final int index;
  const ListWidget({
    Key? key,
    required this.product,
    required this.animation,
    // required this.quantity,
    required this.index,
  }) : super(key: key);

  @override
  State<ListWidget> createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {

  @override
  Widget build(BuildContext context) => SizeTransition(
      key: ValueKey(widget.product.product_id),
      sizeFactor: widget.animation,
      child: buildItem());

  Widget buildItem() {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            child: ListTile(
                contentPadding: EdgeInsets.all(10),
                leading: CircleAvatar(
                  radius: 32,
                  backgroundImage: AssetImage(widget.product.image),
                ),
                title: Text(
                  widget.product.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  '${widget.product.price}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                trailing: CustomNumberPicker(
                  initialValue: 1,
                  maxValue: 10,
                  minValue: 1,
                  onValue: (newvalue) => {setState(() {})},
                  step: 1,
                ))),
        Divider(
          indent: 30,
          endIndent: 30,
          thickness: 2,
        )
      ],
    );
  }
}
