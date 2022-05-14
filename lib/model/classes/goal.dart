class goal {
  int? goal_id;
  int? user_id;
  String? goal_name;
  goal({
    required this.goal_id,
    required this.user_id,
    required this.goal_name,
  });

  Map<String, dynamic> toJson() {
    return {
      'goal_id': goal_id,
      'user_id': user_id,
      'goal_name': goal_name,
    };
  }

  goal.fromJson(Map<String, dynamic> json) {
    goal_id = json['goal_id']?.toInt();
    user_id = json['user_id']?.toInt();
    goal_name = json['goal_name'];
  }
}
