class wieght {
  int? wight_id;
  int? user_id;
  int? wight;
  wieght({
    required this.wight_id,
    required this.user_id,
    required this.wight,
  });

  Map<String, dynamic> toJson() {
    return {
      'wight_id': wight_id,
      'user_id': user_id,
      'wight': wight,
    };
  }

  wieght.fromJson(Map<String, dynamic> json) {
    wight_id = json['wight_id']?.toInt();
    user_id = json['user_id']?.toInt();
    wight = json['wight']?.toInt();
  }
}
