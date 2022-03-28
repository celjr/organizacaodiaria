import 'package:flutter/material.dart';

class Quest extends StatelessWidget {
  const Quest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: double.maxFinite,
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        color: Colors.grey,
        child: Text("tempo livre"),
      ),
    );
  }
}
