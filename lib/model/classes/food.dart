import 'quantity.dart';

class Food {
  int? foodId;
  String? foodName;
  Quantity? quantity;
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
}
