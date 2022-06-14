import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../control/controllers/diet_controller.dart';
import '../../theme.dart';
import '../screens/diet_screen.dart';
import '../screens/exercise_day_screen.dart';
import '../screens/info_screen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  DietController controllerDiet = Get.find();

  var screens = [
    DietScreen(),
    const ExerciseDayScreen(),
    DietScreen(),
    const InfoScreen(),
  ];

  final items = [
    const Icon(Icons.home, size: 30),
    const Icon(Icons.fitness_center, size: 30),
    const Icon(Icons.bar_chart_rounded, size: 30),
    const Icon(Icons.account_circle, size: 30),
  ];

  int _page = 0;

  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: screens[_page],
        bottomNavigationBar: Theme(
          data: Theme.of(context)
              .copyWith(iconTheme: const IconThemeData(color: Colors.white)),
          child: CurvedNavigationBar(
            key: _bottomNavigationKey,
            index: 0,
            height: 60.0,
            items: items,
            color: buttonAndSelectedItem,
            buttonBackgroundColor: buttonAndSelectedItem,
            backgroundColor: const Color.fromARGB(0, 255, 255, 255),
            animationCurve: Curves.ease,
            animationDuration: const Duration(milliseconds: 600),
            onTap: (index) {
              setState(() {
                _page = index;
                //Get.off(screens[index]);
              });
            },
            letIndexChange: (index) => true,
          ),
        ));
  }
}
