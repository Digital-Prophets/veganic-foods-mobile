import 'package:flutter/cupertino.dart';

class backgroundbubbles extends StatelessWidget {
  final String name;
  final double height;
  const backgroundbubbles({
    Key? key,
    required this.name,
    required this.height
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      child: Container(
        child: Stack(
          children: [
            Positioned(
                top: size.height * 0.0001,
                left : size.width * 0.0010,
                child: Image.asset('assets/images/Ellipse 3 (1).png')),
            Positioned(
                top: size.height * 0.099,
                left: size.width * 0.955,
                child: Image.asset('assets/images/Ellipse 4 (1).png')),
            Positioned(
                top: size.height * 0.099,
                left: size.width * 0.5,
                child: Image.asset('assets/images/Ellipse_5.png')),
            Positioned(
                top: 90,
                left: 30,
                child: Text(
                  name,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                )),
          ],
        ),
      ),
      height: height,
    );
  }
}
