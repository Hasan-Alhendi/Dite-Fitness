class Assesement {
  int? id;
  int? oldWeightValue;
  int? newWeightValue;
  int? rank;
  int? isPass;
  Assesement({
    required this.id,
    required this.oldWeightValue,
    required this.newWeightValue,
    required this.rank,
    required this.isPass,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'old_weight_value': oldWeightValue,
      'new_weight_value': newWeightValue,
      'rank': rank,
      'is_pass': isPass,
    };
  }

  Assesement.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    oldWeightValue = json['old_weight_value']?.toInt();
    newWeightValue = json['new_weight_value']?.toInt();
    rank = json['rank']?.toInt();
    isPass = json['is_pass']?.toInt();
  }
}
