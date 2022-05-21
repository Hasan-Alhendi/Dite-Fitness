class Activity {
  int? activityId;
  double? activityFactor;
  String? activityName;
  Activity({
    required this.activityId,
    required this.activityFactor,
    required this.activityName,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': activityId,
      'activity_factor': activityFactor,
      'activity_name': activityName,
    };
  }

  Activity.fromJson(Map<String, dynamic> json) {
    activityId = json['id']?.toInt();
    activityFactor = json['activity_factor']?.toDouble();
    activityName = json['activity_name'];
  }
}
