class TrainingExercises {
  int? id;
  int? daysCount;
  int? activityId;
  String? name;
  TrainingExercises({
    required this.id,
    required this.daysCount,
    required this.activityId,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'days_count': daysCount,
      'activity_id': activityId,
      'name': name,
    };
  }

  TrainingExercises.fromJson(Map<String, dynamic> map) {
    id = map['id']?.toInt();
    daysCount = map['days_count']?.toInt();
    activityId = map['activity_id']?.toInt();
    name = map['name'];
  }
}
