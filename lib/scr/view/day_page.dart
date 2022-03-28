import 'package:flutter/material.dart';

import 'components/day.dart';

class DayPage extends StatelessWidget {
  const DayPage({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Day(screenSize: screenSize)],
      ),
    );
  }
}
