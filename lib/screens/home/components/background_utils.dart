import 'package:flutter/material.dart';
import 'package:veganic_foods_app/constants.dart';

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
              top: size.height * 0.3,
              left: size.width * 0.5,
              child: Image.asset(
                "assets/images/Ellipse_1.png",
                fit: BoxFit.cover,
              )),
          Positioned(
              top: size.height * 0.2,
              left:size.width * 0.19,
              child: Image.asset(
                "assets/images/Ellipse_2.png",
                fit: BoxFit.cover,
              )),
          Positioned(
              top: size.height * 0.0,
              left:size.width * 0.85,
              child: Image.asset(
                "assets/images/Ellipse_3.png",
                fit: BoxFit.cover,
              )),
          Positioned(
              top: size.height * 0.8,
              left:size.width * -0.04,
              child: Image.asset(
                "assets/images/Ellipse_4.png",
                fit: BoxFit.cover,
              )),
          Positioned(
              top: size.height * 0.5,
              left:size.width * 0.75,
              child: Image.asset(
                "assets/images/Ellipse_6.png",
                fit: BoxFit.cover,
              )),
          Positioned(
              top: size.height * 0.8,
              left:size.width * 0.95,
              child: Image.asset(
                "assets/images/Ellipse_1.png",
                fit: BoxFit.cover,
              )),
          Positioned(
              top: size.height * 0.2,
              left: size.width * 0.25,
              child: Image.asset(
                "assets/images/app_logo.png",
                fit: BoxFit.cover,
              )),
          Positioned(
              top: size.height * 0.5,
              left: size.width * 0.15,
              child: Image.asset(
                "assets/images/landing_topping.png",
                fit: BoxFit.cover,
              )),
          Positioned(bottom: size.height*0, left: size.width*0.1, right: size.width*0.1, child: child),
        ],
      ),
    );
  }
}
