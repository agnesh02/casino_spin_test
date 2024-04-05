// ignore_for_file: avoid_print

import 'package:casino_spin_test/screens/spin_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Casino',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SpinPage(title: 'Casino Spin'),
    );
  }
}
