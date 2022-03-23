import 'package:flutter/material.dart';

import 'components/day.dart';

class CreateDayPage extends StatelessWidget {
  const CreateDayPage({Key? key, required this.screenSize}) : super(key: key);
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Day(screenSize: screenSize),
        Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(20),
          width: screenSize.width * 0.4,
          color: Colors.blueGrey,
          child: Column(
            children: [
              const Text(
                "Criando dia",
              ),
              TextFormField()
            ],
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
        ),
      ],
    );
  }
}
