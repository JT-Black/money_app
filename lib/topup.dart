import 'package:flutter/material.dart';
import 'package:money_app/main.dart';
import 'package:money_app/numeric.dart';
import 'package:get/get.dart';
import 'controllers.dart';

class Topup extends StatefulWidget {
  const Topup({Key? key}) : super(key: key);

  @override
  State<Topup> createState() => _TopupState();
}

class _TopupState extends State<Topup> {
  var text = '';
  final BalanceController bal = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.cancel),
            tooltip: 'Comment Icon',
            onPressed: () {
              Navigator.of(context).push(cancelRoute());
            },
          ),
        ],
        automaticallyImplyLeading: false,
        title: const Text('MoneyApp'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            const Text(
              'How much?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '£ ',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                Text(
                  text,
                  style: const TextStyle(color: Colors.white, fontSize: 25),
                ),
              ],
            ),
            NumericKeyboard(
              onKeyboardTap: _onKeyboardTap,
              textColor: Colors.white,
              rightButtonFn: () {
                setState(() {
                  text = text.substring(0, text.length - 1);
                });
              },
              rightIcon: const Icon(
                Icons.backspace,
                color: Colors.white,
              ),
            ),
            ElevatedButton(
              onPressed: () => {
                // print(text),
                // bal.balance + text,
                bal.addTopup(text),
                Navigator.of(context).push(homeRoute()),
              },
              child: const Text(
                'Top Up',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _onKeyboardTap(String value) {
    setState(() {
      text = text + value;
    });
  }
}

Route homeRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const MoneyApp(),
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

Route cancelRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const MoneyApp(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.5, 0.0);
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
