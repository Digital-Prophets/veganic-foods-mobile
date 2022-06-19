import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:veganic_foods_app/constants.dart';
import 'package:veganic_foods_app/screens/basket_page/basket.dart';
import 'package:veganic_foods_app/screens/payment_page/payment.dart';
import 'package:veganic_foods_app/screens/scanning_page/components/qr_code_scanner.dart';
import 'package:veganic_foods_app/utils/globals.dart';
import 'package:veganic_foods_app/utils/routes.dart';

class ScanningPage extends StatelessWidget {
  const ScanningPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        children: [
          Expanded(
              child: Navigator(
            key: mainList,
            initialRoute: Routes.scan,
            onGenerateRoute: (setting) {
              Widget page = QRCodeScanner();
              switch (setting.name) {
                case Routes.scan:
                  page = QRCodeScanner();
                  break;
                case Routes.cart:
                  page = Basketpage();
                  break;
                case Routes.payment:
                  page = PaymentPage();
                  break;
                default:
                  page = QRCodeScanner();
              }
              return PageRouteBuilder(
                  pageBuilder: (_, __, ___) => page,
                  transitionDuration: Duration(seconds: 0));
            },
          ))
        ],
      )),
    );
  }
}

// class ScanningPage extends StatefulWidget {
//   const ScanningPage({Key? key}) : super(key: key);

//   @override
//   State<ScanningPage> createState() => _ScanningPageState();
// }

// class _ScanningPageState extends State<ScanningPage> {
//   int _selectedIndex = 0;
//   List<GlobalKey<NavigatorState>> _navigatorKeys = [
//     GlobalKey<NavigatorState>(),
//     GlobalKey<NavigatorState>(),
//     GlobalKey<NavigatorState>(),
//   ];
//   List<Widget> _children = <Widget>[
//     QRCodeScanner(),
//     Basketpage(),
//     PaymentPage(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async{
//         final isfirstRoutecurrenttab = !await _navigatorKeys[_selectedIndex].currentState!
//             .maybePop();
//         return isfirstRoutecurrenttab;
//       },
//       child: Scaffold(
//           backgroundColor: bGcolor,
//           body: Stack(children: [
//             _buildoffstageNavigator(0),
//             _buildoffstageNavigator(1),
//             _buildoffstageNavigator(2),
//           ],),
//           bottomNavigationBar: BottomNavigationBar(
//               currentIndex:_selectedIndex,
//               backgroundColor: Colors.white,
//               items: [
//                 BottomNavigationBarItem(
//                   icon: Icon(Icons.qr_code),
//                   label: 'qrscanner',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Icon(Icons.shopping_bag),
//                   label: 'basket',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Icon(Icons.payment),
//                   label: 'payment',
//                 ),
//               ],
//               onTap: (int index) {
//                 setState(() {
//                   _selectedIndex = index;
//                 });
//               })),
//     );
//   }
// Map<String, WidgetBuilder> _routeNuilders(BuildContext context, int index){
//   return {
//     '/':(context) {
//       return [
//         QRCodeScanner(),
//         Basketpage(),
//         PaymentPage(),
//       ].elementAt(index);
//     }
//   };
// }

// Widget _buildoffstageNavigator(int index){
//   var routeNuilders = _routeNuilders(context, index);
//   return Offstage(
//     offstage: _selectedIndex != index,
//     child: Navigator(
//       onGenerateRoute: (settings){
//         return MaterialPageRoute(
//           builder: (context) => routeNuilders[settings.name]!(context),
//         );
//       }
//     )
//   );
// }
// }

