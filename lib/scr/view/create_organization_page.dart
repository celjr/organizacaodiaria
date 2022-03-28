import 'package:flutter/material.dart';
import 'package:organizacaodiaria/scr/view/create_quest.dart';
import '../model/quest_model.dart';
import 'components/day.dart';

class CreateDayPage extends StatelessWidget {
  CreateDayPage({Key? key, required this.screenSize}) : super(key: key);
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(10),
        width: screenSize.width,
        height: screenSize.height,
        child: Column(
          children: [
            Day(screenSize: screenSize),
            ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context, builder: (context) => CreateQuest());
                },
                child: const Text("adicionar atividade"))
          ],
        ));
  }
}
