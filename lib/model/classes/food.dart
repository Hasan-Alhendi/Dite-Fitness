class food {
  int? food_id;
  String? food_name;
  food({
    required this.food_id,
    required this.food_name,
  });

  food.fromJson(Map<String, dynamic> json) {
    food_id = json['food_id']?.toInt();
    food_name = json['food_name'];
  }
}
