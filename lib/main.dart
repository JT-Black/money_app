// import 'dart:ui';
import 'package:flutter/material.dart';
import 'home.dart';
// import 'package:get/get.dart';

void main() {
  runApp(const MoneyApp());
}

class MoneyApp extends StatelessWidget {
  const MoneyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MoneyApp',
      theme: ThemeData(
        primarySwatch: Colors.green,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.green[700],
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.green[300], // background (button) color
            onPrimary: Colors.white, // foreground (text) color
          ),
        ),
        scaffoldBackgroundColor: Colors.green[500],
      ),
      home: const Home(),
    );
  }
}
