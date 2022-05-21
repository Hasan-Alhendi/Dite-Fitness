class Wieght {
  int? wightId;
  int? userId;
  int? wight;
  Wieght({
    required this.wightId,
    required this.userId,
    required this.wight,
  });

  Map<String, dynamic> toJson() {
    return {
      'wight_id': wightId,
      'user_id': userId,
      'wight': wight,
    };
  }

  Wieght.fromJson(Map<String, dynamic> json) {
    wightId = json['wight_id']?.toInt();
    userId = json['user_id']?.toInt();
    wight = json['wight']?.toInt();
  }
}
