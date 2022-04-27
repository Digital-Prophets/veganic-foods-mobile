import 'dart:io';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanningPage extends StatefulWidget {
  const ScanningPage({Key? key}) : super(key: key);

  @override
  State<ScanningPage> createState() => _ScanningPageState();
}

class _ScanningPageState extends State<ScanningPage> {
  @override
  Widget build(BuildContext context) {
    Barcode? result;
    QRViewController? controller;
    final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

    @override
    void reassemble() {
      super.reassemble();
      if (Platform.isAndroid) {
        controller!.pauseCamera();
      }
      controller!.resumeCamera();
    }
    return Container();
  }
}
