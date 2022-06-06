import 'quantity.dart';

class Food {
  int? foodId;
  String? foodName;
  Quantity? quantity;
  List<int>? unlikeFoode;
  Food({
    required this.foodId,
    required this.foodName,
    required this.quantity,
  });

  Food.fromJson(Map<String, dynamic> json) {
    foodId = json['id']?.toInt();
    foodName = json['food_name'];
    quantity = Quantity.fromJson(json['quantity']);
  }
  Food.unlikeJson(Map<String, dynamic> json) {
    foodId = json['id']?.toInt();
    foodName = json['food_name'];
  }
  Map<String, dynamic> unlikeToJson() {
    return {
      'unliked_food': unlikeFoode,
    };
  }

  Map<String, dynamic> toMap() {
    return {'id': foodId, 'food_name': foodName, 'quantity': quantity?.toMap()};
  }
}
