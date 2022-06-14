class Day {
  int? dayId;
  int? trainingExerciseDayId;
  String? dayName;
  Day({
    required this.dayId,
    required this.trainingExerciseDayId,
    required this.dayName,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': dayId,
      'training_exercise_day_id': trainingExerciseDayId,
      'day_name': dayName,
    };
  }

  Day.fromJson(Map<String, dynamic> map) {
    dayId = map['id']?.toInt();
    trainingExerciseDayId = map['training_exercise_day_id']?.toInt();
    dayName = map['day_name'];
  }
}
