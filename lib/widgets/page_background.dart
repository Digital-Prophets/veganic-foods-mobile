import 'package:flutter/material.dart';
import 'package:veganic_foods_app/widgets/custom_page_header.dart';
class PagesBackground extends StatelessWidget {
  const PagesBackground({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      child: Stack(
        children: [
          Positioned(
              top: size.height * 0.0002,
              left : size.width * 0.001,
              child: Image.asset('assets/images/Ellipse_9.png')),
          Positioned(
              top: size.height * 0.095,
              left : size.width * 0.955,
              child: Image.asset('assets/images/Ellipse_10.png')),
           Positioned(
            left : size.width * 0.05,
            top: size.height * 0.099,
            right: null,
            bottom: null,
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/avatars/user-female.png'),
            ),
          ),
          Positioned(
            top: size.height * 0.11,
            left: size.width * 0.2,
            right: null,
            bottom: null,
            child: Text('Hi User', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
          ),
          Positioned(
            top: size.height * 0.15,
            left: size.width * 0.2,
            right: null,
            bottom: null,
            child: Text('What would like to order today?', style: TextStyle(fontSize: 16)),
          ),
          Positioned(
              top: size.height * 0.099,
              left: size.width * 0.5,
              child: Image.asset('assets/images/Ellipse_5.png')),
                  ],
      ),
      height: 130,
    );
  }
}