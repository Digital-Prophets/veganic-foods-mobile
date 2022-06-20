import 'package:flutter/material.dart';

import '../utils/routes.dart';

class Bottombar extends StatelessWidget {
  const Bottombar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72.5,
      padding: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(color: Colors.grey.shade100, boxShadow: [
        BoxShadow(color: Colors.black.withOpacity(0.2), offset: Offset.zero)
      ]),
      child: Row( 
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        SizedBox  (width: 20),
        ClipOval(
          child: Material(
            color: Colors.white,
            child: IconButton(
              icon: Icon(
                Icons.qr_code,
              ),
              onPressed: () {
                Navigator.pushNamed(context,Routes.scan);
              },
            ),
          ),
        ),
        SizedBox(width:55 ,),
                ClipOval(
          child: Material(
            color: Colors.white,
            child: IconButton(
              icon: Icon(
                Icons.shopping_bag,
              ),
              onPressed: () {
                Navigator.pushNamed(context,Routes.cart);
              },
            ),
          ),
        ),
        SizedBox(width:55 ,),
                ClipOval(
          child: Material(
            color: Colors.white,
            child: IconButton(
              icon: Icon(
                Icons.payment,
              ),
              onPressed: () {
                Navigator.pushNamed(context,Routes.payment);
              },
            ),
          ),
        ),
        SizedBox(width:30 ,)


      ]),
    );
  }
}
