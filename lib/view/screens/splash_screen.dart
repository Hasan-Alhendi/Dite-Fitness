import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../control/controllers/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SplashController dd = Get.find();

    return Scaffold(
      body: initScreen(context),
    );
  }

  initScreen(BuildContext context) {
    AssetImage assetImage = const AssetImage("assets/splash.png");
    Image image = Image(
      image: assetImage,
      height: 200.0,
      width: 250.0,
    );

    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
              color: Color(0xff7990DD),
              gradient: LinearGradient(
                  colors: [(Color(0xff7990DD)), Color(0xff374ABE)],
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft)),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: image,
            ),
            const Padding(padding: EdgeInsets.only(top: 20.0)),
            const Text(
              "Diet Fitness",
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            ),
            const Padding(
                padding: EdgeInsets.only(top: 20.0)), // padding top for button
            const CircularProgressIndicator(
              backgroundColor: Colors.white,
              strokeWidth: 1,
            )
          ],
        )
      ],
    );
  }
}
