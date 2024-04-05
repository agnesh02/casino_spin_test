import 'package:casino_spin_test/slot_machine/slot_machine.dart';
import 'package:flutter/material.dart';

class SlotWidget extends StatelessWidget {
  const SlotWidget({
    super.key,
    required this.whenCreated,
    required this.whenFinished,
  });
  final void Function(SlotMachineController controller) whenCreated;
  final void Function(List<int> results) whenFinished;

  @override
  Widget build(BuildContext context) {
    return SlotMachine(
      rollItems: [
        RollItem(
          index: 0,
          child: Image.asset('assets/images/roll_item_1.png'),
        ),
        RollItem(index: 1, child: Image.asset('assets/images/roll_item_2.png')),
        RollItem(
          index: 2,
          child: Image.asset('assets/images/roll_item_3.png'),
        ),
        RollItem(
          index: 3,
          child: Image.asset('assets/images/roll_item_4.png'),
        ),
        RollItem(
          index: 4,
          child: Image.asset('assets/images/roll_item_5.png'),
        ),
      ],
      onCreated: (controller) => whenCreated(controller),
      onFinished: (resultIndexes) => whenFinished(resultIndexes),
    );
  }
}
