class QuestModel {
  String name;
  String? description;
  double startTime;
  double endTime;

  QuestModel(
      {this.name = '',
      this.description = '',
      this.endTime = 0,
      this.startTime = 0});
  void setName(value) => name = value;
  void setDescripion(value) => description = value;
  void setStartTime(value) => startTime = value;
  void setEndTime(value) => endTime = value;

  @override
  String toString() {
    // TODO: implement toString
    return '''
Name: $name
Description: $description
Start time: $startTime
End time: $endTime
''';
  }
}
