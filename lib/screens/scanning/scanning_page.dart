import 'package:flutter/material.dart';
import 'package:veganic_foods_app/constants/colors.dart';
import 'package:veganic_foods_app/screens/scanning/components/qr_code_scanner.dart';
import 'package:veganic_foods_app/widgets/custom_app_bar.dart';

class ScanningPage extends StatelessWidget {
  const ScanningPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SizedBox(
        height: size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Expanded(child: QRCodeScanner())
          ],
        ),
      )

    );
  }
}
