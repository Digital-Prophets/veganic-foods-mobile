import 'package:flutter/material.dart';
import 'package:veganic_foods_app/constants.dart';
import 'package:veganic_foods_app/screens/payment_page/payment.dart';
import 'package:veganic_foods_app/widgets/custom_button.dart';
import '../../utils/routes.dart';
import '../../widgets/default_back_button.dart';
import '../payment_page/components/background_eclipses.dart';
import 'components/list_items.dart';
import 'components/food_dict.dart';
import 'components/list_widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:veganic_foods_app/main.dart';

class Basketpage extends StatelessWidget {
  final listKey = GlobalKey<AnimatedListState>();
  final List<Listitem> items = List.from(listitems);

  Basketpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bGcolor,
      body: Column(
        children: [
          SizedBox(
            height: 165,
            child: backgroundbubbles(
              name: 'Basket', height: 130,
              
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            height: size.height * 0.691,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
                color: Colors.white),
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.only(top: 5, right: 290),
                    child: DefaultBackButton()),
                Expanded(
                  child: AnimatedList(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    key: listKey,
                    initialItemCount: items.length,
                    itemBuilder: (BuildContext context, int index,
                            Animation<double> animation) =>
                        Slidable(
                      endActionPane: ActionPane(
                          key: ValueKey(items[index]),
                          motion: const ScrollMotion(),
                          dismissible: DismissiblePane(
                            onDismissed: () => removeitem(index),
                          ),
                          children: [
                            //make a button
                            
                            SlidableAction(
                              autoClose: true,
                              flex: 2,
                              onPressed: (context) => removeitem(index),
                              backgroundColor: Color(0xFFEF5350),
                              icon: Icons.delete,
                              label: 'delete',
                            ),
                          ]),
                      child: ListWidget(
                        animation: animation,
                        item: items[index],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                //change to app button
                
                AppButton(
                    text: 'Proceed',
                    fontSize: 20,
                    textColor: Colors.white,
                    bgColor: Colors.black,
                    
                    onTap: () {
                      // Navigator.pushNamed(context,  "/PaymentPage");
                  //  Navigator.pushNamed(context, Routes.scan);
                  //  Navigator.push(context, new MaterialPageRoute(
                  //   builder: (context) => new PaymentPage())
                  // );
                  
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PaymentPage()),
                  );
                //  Navigator.of(context).pushReplacementNamed('/screen1');
                  // Navigator.of(context, rootNavigator: true).pushNamed("/PaymentPage");
                    },
                    fontWeight: FontWeight.bold,
                    borderRadius: 30,
                    height: 1)
                    
              ],
            ),
          ),
        ],
      ),
    );
  }
  removeitem(int index) {
    final removeItem = items[index];
    items.removeAt(index);
    listKey.currentState!.removeItem(
        index,
        (context, animation) =>
            ListWidget(item: removeItem, animation: animation));
  }
}
