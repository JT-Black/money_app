import 'package:flutter/material.dart';
import 'package:money_app/who.dart';
import 'package:money_app/numeric.dart';
import 'topup.dart';
import 'package:get/get.dart';
import 'controllers.dart';

class Pay extends StatefulWidget {
  const Pay({Key? key}) : super(key: key);

  @override
  State<Pay> createState() => _PayState();
}

class _PayState extends State<Pay> {
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
                bal.paymentAmount.value = int.parse(text),
                Navigator.of(context).push(_whoRoute())
              },
              child: const Text(
                'Next',
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

Route _whoRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const Who(),
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
