import 'package:flutter/material.dart';

import 'package:math_expressions/math_expressions.dart';


import 'calculator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: calculator(),
    ); // MaterialApp
  }
}


