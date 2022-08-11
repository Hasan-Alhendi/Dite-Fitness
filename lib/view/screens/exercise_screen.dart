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
  const ExerciseScreen({Key? key /* , required mediaUrl */}) : super(key: key);
  //String? mediaUrl;

  @override
  Widget build(BuildContext context) {
    TrainingExercisesController trainingExercisesController = Get.find();
    List<Exercise> listExercises = trainingExercisesController.exerciseList;
    var index = 0;
    // var pathIndex = 0;
    ExerciseDetailscontroller exerciseDetailscontroller = Get.find();
    return YoutubePlayerBuilder(
      builder: (context, player) => Scaffold(
        backgroundColor: solidBackground,
        appBar: customAppBar(title: 'التمارين الرياضية'),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Center(child: player),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text('طريقة لعب التمرين'),
                IconButton(
                    onPressed: () {
                      exerciseDetailscontroller.detail.value =
                          listExercises[index].description!;
                      Get.toNamed(
                        Routes.exerciseDetailsScreen,
                        arguments: index,
                      );
                    },
                    icon: const Icon(Icons.info_outline)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {
                      index == 0 ? index = 0 : index--;

                      String url =
                          trainingExercisesController.exercisePath[index];

                      controller.youtubePlayerController
                          .load(YoutubePlayer.convertUrlToId(url)!);
                    },
                    icon: const Icon(
                      Icons.skip_previous,
                      size: 70,
                    )),
                IconButton(
                    onPressed: () {
                      index ==
                              trainingExercisesController.exercisePath.length -
                                  1
                          ? index =
                              trainingExercisesController.exercisePath.length -
                                  1
                          : index++;

                      String url = trainingExercisesController.exercisePath[
                          index]; /*"https://www.youtube.com/watch?v=pFuZJJABbkU&list=PLjDRJj7TtsBONMSzbtDwjUkvWUHJfc-Bn&index=3&ab_channel=Fitness";*/
                      controller.youtubePlayerController
                          .load(YoutubePlayer.convertUrlToId(url)!);
                    },
                    icon: const Icon(
                      Icons.skip_next,
                      size: 70,
                    )),
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
