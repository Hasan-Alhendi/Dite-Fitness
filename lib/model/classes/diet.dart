import 'meal.dart';

class Diet {
  int? dietId;
  int? calory;
  int? modelNumber;
  int? protien;
  int? carbohydrate;
  int? fats;
  List<Meal>? meals;
  Diet({
    required this.dietId,
    required this.calory,
    required this.modelNumber,
    required this.protien,
    required this.carbohydrate,
    required this.fats,
    required this.meals,
  });

  Diet.fromjson(Map<String, dynamic> json) {
    dietId = json['id'];
    calory = json['calory'];
    modelNumber = json['model_number'];
    protien = json['protien'];
    carbohydrate = json['carbohydrate'];
    fats = json['fats'];
    meals = List<Meal>.from(json['meals']?.map((x) => Meal.fromJson(x)));

    // print(meals);
    // print(List<Meal>.from(json['meal']?.map((x) => Meal.fromJson(x))));
  }
}
