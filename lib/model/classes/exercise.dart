class Exercise {
  int? exerciseId;
  String? count;
  double? time;
  String? exerciseName;
  String? videoPath;
  String? externalImage;
  String? internalImage;
  String? musculImage;
  String? description;
  Exercise({
    required this.exerciseId,
    required this.count,
    required this.time,
    required this.exerciseName,
    required this.videoPath,
    required this.externalImage,
    required this.internalImage,
    required this.musculImage,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': exerciseId,
      'count': count,
      'time': time,
      'exercise_name': exerciseName,
      'video_path': videoPath,
      'external_image': externalImage,
      'enternal_image': internalImage,
      'muscle_image': musculImage,
      'description': description,
    };
  }

  Exercise.fromJson(Map<String, dynamic> map) {
    exerciseId = map['id']?.toInt();
    count = map['count'];
    time = map['time']?.toDouble();
    exerciseName = map['exercise_name'];
    videoPath = map['video_path'];
    externalImage = map['external_image'];
    internalImage = map['enternal_image'];
    musculImage = map['muscle_image'];
    description = map['description'];
  }
}
