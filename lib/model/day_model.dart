import 'activity_model.dart';

class Day {
  final List<ActivityModel> dayActivity;
  var _hours = 24;

  Day(this.dayActivity);

  get DayHours => _hours;
}
