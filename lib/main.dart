import 'package:calculator/utility/calulator_logic.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(" Research Calculator from Tonye ", style: TextStyle(color: Colors.blue),),
        ),
        body: CalculatorApp(),
      ),
    );
  }
}
