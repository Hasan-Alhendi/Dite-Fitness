class meal {
  int? meal_id;
  int? diet_id;
  String? type;
  meal({
    required this.meal_id,
    required this.diet_id,
    required this.type,
  });

  meal.fromJson(Map<String, dynamic> json) {
    meal_id = json['id']?.toInt();
    diet_id = json['diet_id']?.toInt();
    type = json['type'];
  }
}
