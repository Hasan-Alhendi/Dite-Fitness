import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../control/controllers/login_controller.dart';
import '../../routes.dart';
import '../../theme.dart';

//import 'logen.dart';

class MyDrawers extends StatefulWidget {
  const MyDrawers({Key? key}) : super(key: key);

  @override
  _MyDrawersState createState() => _MyDrawersState();
}

class _MyDrawersState extends State<MyDrawers> {
  LoginController loginController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: solidBackground,
      elevation: 25,
      child: ListView(
        children: [
/*           ListTile(
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.category),
              iconSize: 25,
              color: Colors.blue[900],
            ),
            title: const Text(
              "Sections",
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
        */
          ListTile(
            leading: IconButton(
              onPressed: () {
                Get.toNamed(Routes.notificationsScreen);
              },
              icon: const Icon(Icons.notifications),
              iconSize: 25,
              color: buttonAndSelectedItem,
            ),
            title: Text(
              'الإشعارات',
              style: body2Style,
            ),
          ),
          ListTile(
            leading: IconButton(
              onPressed: () {
                loginController.doLogOut();
              },
              icon: const Icon(Icons.exit_to_app),
              iconSize: 25,
              color: buttonAndSelectedItem,
            ),
            title: Text(
              "تسجيل الخروج",
              style: body2Style,
            ),
          ),
          /* ExpansionTile(
            title: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.settings,
                  size: 25,
                  color: Colors.blue[900],
                ),
                const SizedBox(
                  width: 24,
                ),
                const Text(
                  "Setting",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ],
            ),
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            expandedAlignment: Alignment.centerLeft,
            childrenPadding: const EdgeInsets.all(1),
            children: [
              Column(
                children: [
                  ListTile(
                    leading: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.blur_linear_sharp),
                      iconSize: 25,
                      color: Colors.blue[900],
                    ),
                    title: const Text(
                      'language',
                      style: TextStyle(fontSize: 20, color: Colors.black54),
                    ),
                  ),
                  ListTile(
                    leading: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Get.isDarkMode
                            ? Icons.wb_sunny_outlined
                            : Icons.nightlight_round,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                    title: const Text(
                      'Mode',
                      style: TextStyle(fontSize: 20, color: Colors.black54),
                    ),
                  ),
                  ListTile(
                    leading: IconButton(
                      onPressed: () {
                        Get.offAndToNamed(Routes.login);
                      },
                      icon: const Icon(Icons.exit_to_app),
                      iconSize: 25,
                      color: Colors.blue[900],
                    ),
                    title: const Text(
                      "Log out",
                      style: TextStyle(fontSize: 20, color: Colors.black54),
                    ),
                  ),
                ],
              ),
            ],
          ),
 */
          const Divider(
            color: Colors.white,
            thickness: 1,
          ),
          ListTile(
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.share),
              iconSize: 25,
              color: buttonAndSelectedItem,
            ),
            title: Text(
              "share",
              style: body2Style,
            ),
          ),
          ListTile(
            leading: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.info),
                iconSize: 25,
                color: buttonAndSelectedItem),
            title: Text(
              "about",
              style: body2Style,
            ),
          ),
        ],
      ),
    );
  }
}
