import 'package:flutter/material.dart';
import 'package:organizacaodiaria/model/activity_model.dart';

import 'components/day.dart';

class CreateDayPage extends StatelessWidget {
  CreateDayPage({Key? key, required this.screenSize}) : super(key: key);
  final Size screenSize;
  var activity = ActivityModel();

  static const hours = <String>[
    '00',
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '09',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23'
  ];

  final List<DropdownMenuItem<String>> _dropDownMenuItem = hours
      .map(
        (String value) => DropdownMenuItem(
          value: value,
          child: Text('$value h'),
        ),
      )
      .toList();

  String? _itemSelectedStartTime;
  String? _itemSelectedEndTime;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        width: screenSize.width,
        height: screenSize.height,
        child: Column(
          children: [
            const Text(
              "Atividade",
            ),
            Form(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20),
                CustomTextFild(
                  label: "Nome da atividade",
                  onSave: (value) => activity.setName(value),
                ),
                const SizedBox(height: 20),
                CustomTextFild(
                  label: "Descrição",
                  lines: 5,
                  onSave: (value) => activity.setDescripion(value),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Flexible(
                        child: DropdownButtonFormField<String>(
                            value: _itemSelectedStartTime,
                            items: _dropDownMenuItem,
                            hint: const Text("Hora de inicio"),
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                _itemSelectedStartTime = newValue;
                              }
                            },
                            onSaved: (_itemSelectedStartTime) =>
                                activity.setStartTime(
                                    double.parse(_itemSelectedStartTime!)))),
                    const SizedBox(width: 10),
                    Flexible(
                        child: DropdownButtonFormField<String>(
                            value: _itemSelectedEndTime,
                            items: _dropDownMenuItem,
                            hint: const Text("Hora de Termino"),
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                _itemSelectedEndTime = newValue;
                              }
                            },
                            onSaved: (_itemSelectedEndTime) =>
                                activity.setEndTime(
                                    double.parse(_itemSelectedEndTime!)))),
                  ],
                ),
                const SizedBox(height: 20),
                Builder(builder: (context) {
                  return ElevatedButton(
                      onPressed: () {
                        print(Form.of(context));
                        Form.of(context)?.save();
                        print(activity.toString());
                      },
                      child: const Text("Adicionar tarefa"));
                })
              ],
            ))
          ],
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
      ),
    );
  }
}

class CustomTextFild extends StatelessWidget {
  final String label;
  final int lines;
  final void Function(String? text)? onSave;
  const CustomTextFild(
      {Key? key, required this.label, this.lines = 1, required this.onSave})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: lines,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      onSaved: onSave,
    );
  }
}
