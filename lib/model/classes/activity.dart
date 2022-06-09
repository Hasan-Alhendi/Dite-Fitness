class Activity {
  int? activityId;
  double? activityFactor;
  String? activityName;
  String? description;
  Activity({
    required this.activityId,
    required this.activityFactor,
    required this.activityName,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': activityId,
      'activity_factor': activityFactor,
      'activity_name': activityName,
      'description': description,
    };
  }

  Activity.fromJson(Map<String, dynamic> json) {
    activityId = json['id']?.toInt();
    activityFactor = json['activity_factor']?.toDouble();
    activityName = json['activity_name'];
    description = json['description'];
  }
}
