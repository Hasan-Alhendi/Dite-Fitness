class Quantity {
  double? count;
  int? weight;
  String? unit;
  String? quantityStr;
  Quantity({
    required this.count,
    required this.weight,
    required this.unit,
    required this.quantityStr,
  });

  Quantity.fromJson(Map<String, dynamic> map) {
    count = map['count']?.toDouble();
    weight = map['weight'];
    unit = map['unit'];
    quantityStr = map['quantity_str'];
  }
}
