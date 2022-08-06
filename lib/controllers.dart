import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'dart:core';

class BalanceController extends GetxController {
  var balance = 100.01.obs;
  var paymentAmount = 0.00.obs;
  final transactions = [
    {
      'type': 'topup',
      'description': 'topup',
      'amount': 100.01,
    },
  ].obs;

  addTopup(text) {
    text = double.parse(text).toStringAsFixed(2);
    transactions.add(
      {
        'type': 'topup',
        'description': 'topup',
        'amount': text,
      },
    );
    balance + double.parse(text);
  }

  addPayment(text, payee) {
    // double.parse(text).toStringAsFixed(2);
    transactions.add(
      {
        'type': const Icon(Icons.shopping_bag_rounded),
        'description': payee,
        'amount': text,
      },
    );

    balance - text;
  }
}
