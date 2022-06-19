import 'package:flutter/material.dart';
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
              left: size.width * -0.02,
              top: size.height * -0.01,
              child: Image.asset('assets/images/Ellipse_9.png')),
          Positioned(
              top: size.height*0.05,
              left: size.width*0.95,
              child: Image.asset('assets/images/Ellipse_10.png')),
           Positioned(
            left: size.width * 0.07,
            top: size.height*0.1,
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/avatars/user-female.png'),
            ),
          ),
           Positioned(
            left: size.width*0.2 ,
            top:size.height*0.11,
            right: null,
            bottom: null,
            width: 52.0,
            height: 20.0,
            child: Text('Hi User', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
          ),
          const Positioned(
            left: 80.0,
            top: 120.0,
            right: null,
            bottom: null,
            width: 241.0,
            height: 20.0,
            child: Text('What would like to order today?', style: TextStyle(fontSize: 16)),
          ),
          Positioned(
              top: 26,
              left:239,
              width: 13.0,
              height: 13.0,
              child: Image.asset('assets/images/Ellipse_5.png')),
                  ],
      ),
      height: 130,
    );
  }
}