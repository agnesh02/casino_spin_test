// ignore_for_file: avoid_print

import 'dart:math';

import 'package:casino_spin_test/slot_machine/slot_machine.dart';
import 'package:casino_spin_test/widget/slot_widget.dart';
import 'package:flutter/material.dart';

class SpinPage extends StatefulWidget {
  const SpinPage({super.key, required this.title});
  final String title;

  @override
  createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SpinPage> {
  late SlotMachineController _controller;

  @override
  void initState() {
    super.initState();
  }

  void stopSpin({required int index}) {
    _controller.stop(reelIndex: index);
  }

  void onStart() {
    final index = Random().nextInt(7);
    _controller.start(hitRollItemIndex: index < 5 ? index : null);
    delayedFunction(3, () => stopSpin(index: 0));
    delayedFunction(2, () => stopSpin(index: 1));
    delayedFunction(1, () => stopSpin(index: 2));
  }

  void delayedFunction(int seconds, Function() function) {
    Future.delayed(Duration(seconds: seconds), function);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFE91E63), // Pink
              Color(0xFF2196F3), // Blue
              Color(0xFFFFC107), // Amber
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SlotWidget(
                whenCreated: (controller) {
                  _controller = controller;
                },
                whenFinished: (results) {
                  print('Result: $results');
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text('START'),
                  onPressed: () => onStart(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
