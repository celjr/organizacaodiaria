import 'package:flutter/material.dart';

import '../model/quest_model.dart';
import 'components/custom_text_field.dart';

class CreateQuest extends StatefulWidget {
  CreateQuest({Key? key}) : super(key: key);
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

  @override
  State<CreateQuest> createState() => _CreateQuestState();
}

class _CreateQuestState extends State<CreateQuest> {
  var quest = QuestModel();

  final List<DropdownMenuItem<String>> _dropDownMenuItem = CreateQuest.hours
      .map(
        (String value) => DropdownMenuItem(
          value: value,
          child: Text('$value h'),
        ),
      )
      .toList();

  String? _itemSelectedStartTime;

  String? _itemSelectedEndTime;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(10),
      child: Column(children: [
        Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20),
              CustomTextField(
                  label: "Nome da atividade",
                  onSave: (value) => quest.setName(value),
                  validate: (value) {
                    if (value!.isEmpty || value == null) {
                      return "esse campo não pode ser nulo";
                    }
                    ;
                  }),
              const SizedBox(height: 20),
              CustomTextField(
                label: "Descrição",
                lines: 5,
                onSave: (value) =>
                    value != null ? quest.setDescripion(value) : null,
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
                          validator: (_itemSelectedEndTime) {
                            if (_itemSelectedStartTime == null) {
                              return "selecione a hora que essa atividade vai acabar";
                            }
                          },
                          onSaved: (_itemSelectedStartTime) =>
                              quest.setStartTime(
                                  double.parse(_itemSelectedStartTime!)))),
                  const SizedBox(width: 10),
                  Flexible(
                      child: DropdownButtonFormField<String>(
                    value: _itemSelectedEndTime,
                    items: _dropDownMenuItem,
                    hint: const Text("Hora de Termino"),
                    validator: (_itemSelectedEndTime) {
                      if (_itemSelectedEndTime == null) {
                        return "selecione a hora que essa atividade vai acabar";
                      }
                    },
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        _itemSelectedEndTime = newValue;
                      }
                    },
                    onSaved: (_itemSelectedEndTime) =>
                        quest.setEndTime(double.parse(_itemSelectedEndTime!)),
                  )),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      Navigator.of(context).pop();
                    }
                    print(quest.toString());
                  },
                  child: const Text("Adicionar tarefa"))
            ],
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
        ),
      ]),
    );
  }
}
