class UnlikeFood {
  int? id;
  UnlikeFood({
    required this.id,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
    };
  }

  UnlikeFood.fromJson(Map<String, dynamic> map) {
    id = map['id']?.toInt();
  }
}
