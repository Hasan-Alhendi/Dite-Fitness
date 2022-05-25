import 'package:flutter/material.dart';

import '../../theme.dart';

AppBar customAppBar({String title = ""}) {
  return AppBar(
    elevation: 0,
    backgroundColor: solidBackground,
    title: Text(
      title,
      style: headingStyle,
    ),
    centerTitle: true,
    //leading: Drawer(),
  );
}
