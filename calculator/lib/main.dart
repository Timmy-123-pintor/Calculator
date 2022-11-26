// ignore_for_file: unused_import

import 'package:flutter/material.dart';

import 'calc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const Calculator(),
    );
  }
}
