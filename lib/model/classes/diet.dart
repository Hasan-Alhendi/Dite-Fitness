class deit {
  int? diet_id;
  int? calory;
  int? model_number;
  deit({
    required this.diet_id,
    required this.calory,
    required this.model_number,
  });

  deit.fromJson(Map<String, dynamic> json) {
    diet_id = json['id']?.toInt();
    calory = json['calory']?.toInt();
    model_number = json['model_number']?.toInt();
  }
}
