import 'quest_model.dart';

class DayModel {
  final List<QuestModel> dayQuests;
  var _hours = 24;

  DayModel(this.dayQuests);

  void AddQuest(QuestModel quest) => dayQuests.add(quest);
  get DayHours => _hours;
}
