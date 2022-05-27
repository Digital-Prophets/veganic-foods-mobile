import 'package:custom_navigator/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:veganic_foods_app/constants.dart';
import 'package:veganic_foods_app/screens/home/components/background_func.dart';
import 'package:veganic_foods_app/screens/basket_page/basket.dart';
import 'package:veganic_foods_app/screens/home/home.dart';
import 'package:veganic_foods_app/screens/payment_page/payment.dart';
import 'package:veganic_foods_app/screens/scanning_page/components/qr_code_scanner.dart';
import 'package:veganic_foods_app/screens/scanning_page/scan.dart';
import 'package:veganic_foods_app/utils/routes.dart';
// import 'components/qr_code_scanner.dart';
import 'screens/scanning_page/components/qr_code_scanner.dart';

void main() => runApp(MyApp());

//give a navigator key to [MaterialApp] if you want to use the default navigation
//anywhere in your app eg: line 15 & line 93
GlobalKey<NavigatorState> mainNavigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      title: 'Veganic App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'SF Pro Rounded',
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:MyHomePage(),
      
      // routes: routes,
      // initialRoute: "/",
      routes: {
        Routes.home: (context) => const LandingPage(),
        Routes.scan: (context) => const ScanningPage(),
        Routes.cart: (context) => Basketpage(),
        Routes.payment: (context) => const PaymentPage()
        
      },
    //   routes: <String, WidgetBuilder>{
    //     "/listadecompras": (BuildContext context) => new PaymentPage()
    // }
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(backgroundColor: bGcolor, body:Components()
      // body: PayGate(),
    );
  }

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  // Custom navigator takes a global key if you want to access the
  // navigator from outside it's widget tree subtree
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    // Here's the custom scaffold widget
    // It takes a normal scaffold with mandatory bottom navigation bar
    // and children who are your pages
    return CustomScaffold(
      key: navigatorKey,
      scaffold: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: _items,
        ),
      ),

      // Children are the pages that will be shown by every click
      // They should placed in order such as
      // `page 0` will be presented when `item 0` in the [BottomNavigationBar] clicked.
      children: <Widget>[
        
        ScanningPage(),
        Basketpage(),
        PaymentPage(),
      ],

      // Called when one of the [items] is tapped.
      onItemTap: (index) {},
    );
  }

  final _items = [
    
    BottomNavigationBarItem(icon: Icon(Icons.qr_code), label: 'QR Code Scan',),
    BottomNavigationBarItem(icon: Icon(Icons.shopping_basket), label: 'Basket'),
    BottomNavigationBarItem(
icon: Icon(Icons.payment), label: 'Payment'),
  ];
}

// class Page extends StatelessWidget {
//   final String title;

//   const Page(this.title) : assert(title != null);

//   @override
//   Widget build(BuildContext context) {
//     final text = Text(title);

//     return Scaffold(
//       body: Container(
//         child: Center(
//             child: FlatButton(
//                 onPressed: () => _openBasketpage(context), child: text)),
//       ),
//       appBar: AppBar(
//         title: text,
//       ),
//     );
//   }

//   //Use the navigator like you usually do with .of(context) method
//   _openBasketpage(BuildContext context) => Navigator.of(context)
//       .push(MaterialPageRoute(builder: (context) => Basketpage()));

// //  _openDetailsPage(BuildContext context) => mainNavigatorKey.currentState.push(MaterialPageRoute(builder: (context) => DetailsPage(title)));

// }



// class ScanningPage extends StatelessWidget {
//   const ScanningPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return const Scaffold(
//       backgroundColor: Colors.white,
//       body:QRCodeScanner()
//     );
//   }
// }

// class DetailsPage extends StatelessWidget {
//   final String title;

//   const DetailsPage(this.title) : assert(title != null);

//   @override
//   Widget build(BuildContext context) {
//     final text = Text('Details of $title');
//     return Scaffold(
//       body: Container(
//         child: Center(child: text),
//       ),
//       appBar: AppBar(title: text),
//     );
//   }
// }

