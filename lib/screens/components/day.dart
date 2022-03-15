import 'package:flutter/material.dart';

class Day extends StatefulWidget {
  const Day({Key? key, required this.screenSize}) : super(key: key);
  final Size screenSize;
  @override
  State<Day> createState() => _DayState(screenSize);
}

class _DayState extends State<Day> {
  final Size screenSize;
  _DayState(this.screenSize);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(20),
        width: screenSize.width * 0.4,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(100)),
            boxShadow: [
              BoxShadow(color: Colors.grey, blurRadius: 12, spreadRadius: 5)
            ]));
  }
}
