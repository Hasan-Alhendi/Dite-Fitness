class Goal {
  int? goalId;
  int? userId;
  String? goalName;
  Goal({
    required this.goalId,
    required this.userId,
    required this.goalName,
  });

  Map<String, dynamic> toJson() {
    return {
      'goal_id': goalId,
      'user_id': userId,
      'goal_name': goalName,
    };
  }

  Goal.fromJson(Map<String, dynamic> json) {
    goalId = json['goal_id']?.toInt();
    userId = json['user_id']?.toInt();
    goalName = json['goal_name'];
  }
}
