import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'dart:core';

class BalanceController extends GetxController {
  var balance = 100.01.obs;
  // var balance = num.parse(balance.toStringAsFixed(2)).obs;
  var paymentAmount = 0.obs;
  final transactions = [
    {
      'type': 'topup',
      'description': 'topup',
      'amount': 100.01,
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
    balance + double.parse(text);
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
