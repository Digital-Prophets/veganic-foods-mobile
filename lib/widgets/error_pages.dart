import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veganic_foods_app/widgets/custom_button.dart';
import '../screens/scanning_page/scan.dart';

Notfound(image) => Scaffold(
      body: Stack(
        // fit: StackFit.expand,
        children: [
          Image.asset(
            image,
            fit: BoxFit.fill,
          ),
          Container(
            padding: EdgeInsets.only(left: 20, top: 600, bottom: 5),
            child: AppButton(
                text: 'return to scan',
                fontSize: 15,
                textColor: Colors.white,
                bgColor: Colors.green.shade300,
                onTap: () => Get.to(ScanningPage()),
                fontWeight: FontWeight.normal,
                borderRadius: 40,
                height: 24),
          )
        ],
      ),
    );
