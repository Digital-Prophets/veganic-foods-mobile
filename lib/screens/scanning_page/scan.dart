import 'package:flutter/material.dart';
import 'package:veganic_foods_app/constants.dart';
import 'package:veganic_foods_app/screens/basket_page/basket.dart';
import 'package:veganic_foods_app/screens/payment_page/payment.dart';
import 'components/qr_code_scanner.dart';

class ScanningPage extends StatefulWidget {
  const ScanningPage({Key? key}) : super(key: key);

  @override
  State<ScanningPage> createState() => _ScanningPageState();
}

class _ScanningPageState extends State<ScanningPage> {
  final screens = [
    QRCodeScanner(),
    Basketpage(),
    PaymentPage()
    ];
   int _currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        backgroundColor: Colors.blueGrey.shade100,
        currentIndex: _currentindex,
        onTap: (index)=>setState(()=>_currentindex=index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Qr scanner',
            backgroundColor: Colors.blueGrey.shade100
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Basket',
            backgroundColor: Colors.blueGrey.shade100
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
           label: 'Payment',
            backgroundColor: Colors.blueGrey.shade100
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body:IndexedStack(
        index: _currentindex,
        children: screens),
    );
  }
}
