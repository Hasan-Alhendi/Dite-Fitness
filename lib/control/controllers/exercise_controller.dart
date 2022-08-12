//import 'package:better_player/better_player.dart';
//import 'package:chewie/chewie.dart';
//import 'package:flutter/cupertino.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'package:get/get.dart';

import 'training_exercises_controller.dart';
//import 'package:video_player/video_player.dart';

class ExerciseController extends GetxController {
  late YoutubePlayerController youtubePlayerController;
  TrainingExercisesController trainingExercisesController = Get.find();

  @override
  void onInit() {
    String? url = trainingExercisesController.exercisePath[0];
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(url!)!,
      flags: const YoutubePlayerFlags(
        controlsVisibleAtStart: true,
        autoPlay: true,
        loop: true,
      ),
    );
    super.onInit();
  }

  @override
  void dispose() {
    youtubePlayerController.dispose();
    super.dispose();
  }

  /*
  late VideoPlayerController videoPlayerController;
  late BetterPlayerController betterPlayerController;
  var mediaUrl = ''.obs;
  GlobalKey betterPlayerKey = GlobalKey();
  ChewieController? chewieController;
  @override
  void onInit() {
    BetterPlayerConfiguration betterPlayerConfiguration =
        const BetterPlayerConfiguration(
            aspectRatio: 19 / 6, fit: BoxFit.contain);
    BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
        BetterPlayerDataSourceType.network,
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4' /* mediaUrl.value */);
    betterPlayerController = BetterPlayerController(betterPlayerConfiguration);
    betterPlayerController.setupDataSource(betterPlayerDataSource);
    betterPlayerController.setBetterPlayerGlobalKey(betterPlayerKey);

    intializePlayer();
    super.onInit();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController!.dispose();
    super.dispose();
  }

  @override
  void onClose() {
    videoPlayerController.dispose();
    chewieController!.dispose();
    super.onClose();
  }

  Future<void> intializePlayer() async {
    videoPlayerController = VideoPlayerController.asset('assets/1.mp4');
    //videoPlayerController = VideoPlayerController.network('https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
    await Future.wait([videoPlayerController.initialize()]);
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoInitialize: true,
      autoPlay: true,
      looping: true,
      showControls: false,
      //errorBuilder: ,
    );
    update();
  }*/
}
