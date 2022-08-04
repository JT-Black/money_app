import 'package:flutter/material.dart';
import 'package:money_app/pay.dart';
import 'package:money_app/topup.dart';
import 'package:get/get.dart';
import 'controllers.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BalanceController bal = Get.put(BalanceController());

    List yesterday = const [
      ListTile(
        leading: Icon(Icons.shopping_bag_rounded),
        title: Text('John Lewis'),
        trailing: Text('82.24'),
      ),
      ListTile(
        leading: Icon(
          Icons.add_circle_rounded,
        ),
        title: Text('Topup'),
        trailing: Text('100.00'),
      ),
      ListTile(
        leading: Icon(Icons.shopping_bag_rounded),
        title: Text('Sainsburys'),
        trailing: Text('33.43'),
      ),
      ListTile(
        leading: Icon(Icons.shopping_bag_rounded),
        title: Text('M&S'),
        trailing: Text('22.68'),
      ),
      ListTile(
        leading: Icon(Icons.add_circle_rounded),
        title: Text('Topup'),
        trailing: Text('100.00'),
      ),
      ListTile(
        leading: Icon(Icons.shopping_bag_rounded),
        title: Text('Ebay'),
        trailing: Text('40.00'),
      ),
      ListTile(
        leading: Icon(Icons.shopping_bag_rounded),
        title: Text('Amazon'),
        trailing: Text('12.00'),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'MoneyApp',
        ),
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 40,
          ),
          Obx(() => Text(
                '£${bal.balance}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 45,
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 30,
              margin: const EdgeInsets.fromLTRB(40, 30, 40, 5),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () => {Navigator.of(context).push(_payRoute())},
                        child: Column(
                          children: const [
                            Icon(Icons.payment_rounded),
                            Text('Pay'),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () =>
                            {Navigator.of(context).push(_topupRoute())},
                        child: Column(
                          children: const [
                            Icon(Icons.payment_rounded),
                            Text('Top Up'),
                          ],
                        ),
                      ),
                    ]),
              ),
            ),
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Recent Activity',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Padding(
                padding: EdgeInsets.only(left: 8.0, bottom: 8.0),
                child: Text(
                  'Today',
                  style: TextStyle(
                    color: Color.fromARGB(255, 179, 197, 174),
                  ),
                ),
              ),
            ),
          ),
          Container(
            color: Colors.green[050],
            width: double.infinity,
            height: 140,
            child: ListView.builder(
                itemBuilder: (listViewContext, index) {
                  int reverseIndex = bal.transactions.length - 1 - index;
                  return SizedBox(
                    height: 30,
                    child: ListTile(
                      leading: const Icon(Icons.shopping_bag_rounded),
                      title: Text(
                          "${bal.transactions[reverseIndex]['description']}"),
                      trailing:
                          Text("${bal.transactions[reverseIndex]['amount']}"),
                    ),
                  );
                },
                itemCount: bal.transactions.length),
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Padding(
                padding: EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
                child: Text(
                  'Yesterday',
                  style: TextStyle(
                    color: Color.fromARGB(255, 179, 197, 174),
                  ),
                ),
              ),
            ),
          ),
          Container(
            color: Colors.green[050],
            width: double.infinity,
            height: 140,
            child: ListView.builder(
                itemBuilder: (listViewContext, index) {
                  return SizedBox(
                    height: 30,
                    child: yesterday[index],
                  );
                },
                itemCount: yesterday.length),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}

Route _payRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const Pay(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.easeOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Route _topupRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const Topup(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.easeOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
