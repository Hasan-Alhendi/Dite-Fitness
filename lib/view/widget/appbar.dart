import 'package:flutter/material.dart';

import '../../theme.dart';

AppBar customAppBar({String title = "", Widget? widget}) {
  return AppBar(
    elevation: 0,
    backgroundColor: solidBackground,
    actions: [
      Padding(padding: const EdgeInsets.only(right: 20.0), child: widget)
    ],
    title: Text(
      title,
      style: headingStyle,
    ),
    centerTitle: true,
    //leading: Drawer(),
  );
}
