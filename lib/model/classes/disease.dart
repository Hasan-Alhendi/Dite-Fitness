class Disease {
  int? diseaseId;
  String? diseaseName;
  Disease({
    required this.diseaseId,
    required this.diseaseName,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': diseaseId,
      'health_status_name': diseaseName,
    };
  }

  Disease.fromJson(Map<String, dynamic> json) {
    diseaseId = json['id']?.toInt();
    diseaseName = json['health_status_name'];
  }
}
