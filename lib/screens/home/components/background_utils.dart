import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //total height and width of screen

    return SizedBox(
      height: size.height,
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          Positioned(
              top: size.height*0.049,
              left: size.width*0.03,
              child: Image.asset(
                "assets/images/Ellipse_1.png",
                fit: BoxFit.cover,
              )),
          Positioned(
              top: size.height*0.13,
              left: size.width*0.19,
              child: Image.asset(
                "assets/images/Ellipse_2.png",
                fit: BoxFit.cover,
              )),
          Positioned(
              top: size.height*0.0,
              left: size.width*0.85,
              child: Image.asset(
                "assets/images/Ellipse_3.png",
                fit: BoxFit.cover,
              )),
          Positioned(
              top: size.height*0.8,
              left: size.width*0.0,
              child: Image.asset(
                "assets/images/Ellipse_4.png",
                fit: BoxFit.cover,
              )),
          Positioned(
              top: size.height*0.69,
              left: size.width*0.2,
              child: Image.asset(
                "assets/images/Ellipse_5.png",
                fit: BoxFit.cover,
              )),
          Positioned(
              top: size.height*0.45,
              left: size.width*0.87,
              child: Image.asset(
                "assets/images/Ellipse_6.png",
                fit: BoxFit.cover,
              )),
          Positioned(
              top: size.height*0.7,
              left: size.width*0.9,
              child: Image.asset(
                "assets/images/Ellipse_1.png",
                fit: BoxFit.cover,
              )),
          Positioned(
              top: size.height*0.1,
              left: size.width*0.25,
              child: Image.asset(
                "assets/images/app_logo.png",
                fit: BoxFit.cover,
              )),
          Positioned(
              top: size.height*0.4,
              left: size.width*0.15,
              child: Image.asset(
                "assets/images/landing_topping.png",
                fit: BoxFit.cover,
              )),
          Positioned(
              bottom: size.height*0.01,
              left: size.width*0.1,
              right: size.width*0.1,
              child: child),
        ],
      ),
    );
  }
}