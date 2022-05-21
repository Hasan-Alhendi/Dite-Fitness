import 'food.dart';

class Meal {
  int? mealId;
  int? dietId;
  int? type;
  List<Food>? foods;
  Meal({
    required this.mealId,
    required this.dietId,
    required this.type,
    required this.foods,
  });

  Meal.fromJson(Map<String, dynamic> json) {
    mealId = json['meal_id']?.toInt();
    dietId = json['diet_id']?.toInt();
    type = json['type'];
    foods = List<Food>.from(json['foods']?.map((x) => Food.fromJson(x)));
  }
}
