import 'package:flutter/material.dart';
import 'topup.dart';
import 'package:get/get.dart';
import 'controllers.dart';

class Who extends StatefulWidget {
  const Who({Key? key}) : super(key: key);

  @override
  State<Who> createState() => _WhoState();
}

class _WhoState extends State<Who> {
  final BalanceController bal = Get.find();
  String text = '';
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

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
              height: 50,
            ),
            const Text(
              'To Who?',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                    controller: myController,
                    autofocus: true,
                    decoration: const InputDecoration(
                      hintText: 'Enter Payee',
                      border: OutlineInputBorder(),
                    ),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    )),
              ),
            ),
            ElevatedButton(
              onPressed: () => {
                bal.addPayment(bal.paymentAmount.value, myController.text),
                FocusManager.instance.primaryFocus?.unfocus(),
                Navigator.of(context).push(homeRoute())
              },
              child: const Text('Pay'),
            ),
          ],
        ),
      ),
    );
  }
}
