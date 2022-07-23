//import 'package:better_player/better_player.dart';
//import 'package:chewie/chewie.dart';
import 'package:dite_fitness/view/widget/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../control/controllers/exercise_controller.dart';
import '../../control/controllers/exercise_details_controller.dart';
import '../../control/controllers/training_exercises_controller.dart';
import '../../model/classes/exercise.dart';
import '../../routes.dart';
import '../../theme.dart';

class ExerciseScreen extends GetView<ExerciseController> {
  ExerciseScreen({Key? key, required mediaUrl}) : super(key: key);
  String? mediaUrl;

  @override
  Widget build(BuildContext context) {
    TrainingExercisesController trainingExercisesController = Get.find();
    List<Exercise> listExercises = trainingExercisesController.exerciseList;
    var index = Get.arguments;
    ExerciseDetailscontroller exerciseDetailscontroller = Get.find();
    return YoutubePlayerBuilder(
      builder: (context, player) => Scaffold(
        backgroundColor: solidBackground,
        appBar: customAppBar(title: 'التمارين الرياضية'),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  exerciseDetailscontroller.detail.value =
                      listExercises[index].description!;
                  Get.toNamed(
                    Routes.exerciseDetailsScreen,
                  );
                },
                icon: const Icon(Icons.info_outline)),
            Center(child: player),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      index == 0 ? index = 0 : index--;

                      String
                          url = /*listExercises[index]
                          .videoPath! */
                          "https://youtu.be/71zT3uNt5lw";
                      controller.youtubePlayerController
                          .load(YoutubePlayer.convertUrlToId(url)!);
                    },
                    icon: const Icon(Icons.next_plan)),
                IconButton(
                    onPressed: () {
                      index == listExercises.length - 1
                          ? index = listExercises.length - 1
                          : index++;

                      String
                          url = /*listExercises[index].videoPath!*/ "https://www.youtube.com/watch?v=pFuZJJABbkU&list=PLjDRJj7TtsBONMSzbtDwjUkvWUHJfc-Bn&index=3&ab_channel=Fitness";
                      controller.youtubePlayerController
                          .load(YoutubePlayer.convertUrlToId(url)!);
                    },
                    icon: const Icon(Icons.skip_next)),
              ],
            ),
          ],
        ),
        //________________________________________________
        /*BetterPlayer(
            controller: controller.betterPlayerController,
            key: controller.betterPlayerKey,
          ) */
        //________________________________________________
        /* GetBuilder<ExerciseController>(
          init: ExerciseController(),
          builder: (cn) => Center(
              child: cn.chewieController != null &&
                      cn.chewieController!.videoPlayerController.value
                          .isInitialized
                  ? Chewie(controller: cn.chewieController!)
                  : const CircularProgressIndicator()),
        ),*/
        //_________________________________________________
      ),
      player: YoutubePlayer(
        controller: controller.youtubePlayerController,
        showVideoProgressIndicator: true,
      ),
    );
  }
}
