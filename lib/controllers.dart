import 'package:get/get.dart';
import 'package:flutter/material.dart';

class BalanceController extends GetxController {
  final balance = 100.obs;
  var paymentAmount = 0.obs;
  final transactions = [
    {
      'type': 'topup',
      'description': 'topup',
      'amount': 100,
    },
  ].obs;

  addTopup(text) {
    transactions.add(
      {
        'type': 'topup',
        'description': 'topup',
        'amount': text,
      },
    );
    balance + int.parse(text);
  }

  addPayment(amount, payee) {
    transactions.add(
      {
        'type': const Icon(Icons.shopping_bag_rounded),
        'description': payee,
        'amount': amount,
      },
    );
    balance - amount;
  }
}
