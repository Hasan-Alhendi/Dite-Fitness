class activity {
  int? activity_id;
  int? user_id;
  String? activity_name;
  activity({
    required this.activity_id,
    required this.user_id,
    required this.activity_name,
  });

  Map<String, dynamic> toJson() {
    return {
      'activity_id': activity_id,
      'user_id': user_id,
      'activity_name': activity_name,
    };
  }

  activity.fromJson(Map<String, dynamic> json) {
    activity_id;
    json['activity_id']?.toInt();
    user_id;
    json['user_id']?.toInt();
    activity_name;
    json['activity_name'];
  }
}
