class Quantity {
  int? id;
  int? foodId;
  int? mealFoodId;
  int? mealId;
  double? count;
  int? weight;
  String? unit;
  String? quantityStr;
  Quantity({
    required this.id,
    required this.foodId,
    required this.mealFoodId,
    required this.mealId,
    required this.weight,
    required this.unit,
    required this.quantityStr,
  });

  Quantity.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    mealFoodId = map['meal_food_id']?.toInt();
    mealId = map['meal_id']?.toInt();
    foodId = map['food_id'];
    weight = map['weight'];
    count = map['count']?.toDouble();
    unit = map['unit'];
    quantityStr = map['quantity_str'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'meal_id': mealId,
      'food_id': foodId,
      'meal_food_id': mealFoodId,
      'count': count,
      'weight': weight,
      'unit': unit,
      'quantity_str': quantityStr,
    };
  }
}
