import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../../model/classes/day.dart';
import '../../model/classes/exercise.dart';
import '../../model/classes/training_exercises.dart';
import '../../model/servises/training_exercises_services.dart';
import '../../routes.dart';

class TrainingExercisesController extends GetxController {
  var isLoading = true.obs;
  final storage = const FlutterSecureStorage();

  var trainingExercisesList = <TrainingExercises>[].obs;
  var daysList = <Day>[].obs;
  var exerciseList = <Exercise>[].obs;
  var selectedIndex = 99.obs;

  @override
  void onInit() {
    super.onInit();
    getTrainingExercises();
    getCurrentTrainingExercises();
  }

  getTrainingExercises() async {
    try {
      isLoading(true);
      const apiToken = FlutterSecureStorage();
      String? x = await apiToken.read(key: 'token');
      trainingExercisesList.value =
          await TrainingExercisesServices.getTrainingExercises(apiToken: x);
    } finally {
      isLoading(false);
    }
  }

  getCurrentTrainingExercises() async {
    try {
      isLoading(true);
      const apiToken = FlutterSecureStorage();
      String? x = await apiToken.read(key: 'token');
      daysList.value =
          await TrainingExercisesServices.getCurrentTrainingExercises(
              apiToken: x);
    } finally {
      isLoading(false);
    }
  }

  getSpecificExercises({required id}) async {
    try {
      isLoading(true);
      const apiToken = FlutterSecureStorage();
      String? x = await apiToken.read(key: 'token');
      exerciseList.value = await TrainingExercisesServices.getSpecificExercises(
          apiToken: x, id: id);
    } finally {
      isLoading(false);
    }
  }

  setTrainingExercise({required trainingExerciseId}) async {
    const apiToken = FlutterSecureStorage();
    String? x = await apiToken.read(key: 'token');

    await TrainingExercisesServices.settrainingExercise(
        apiToken: x, trainingExerciseId: trainingExerciseId);
    // await storage.write(key: 'route', value: 'activity');

    Get.toNamed(Routes.bottomBar);
  }
}
