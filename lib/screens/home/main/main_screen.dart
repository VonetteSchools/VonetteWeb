import 'package:vonette_web/constants/constants.dart';
import 'package:vonette_web/screens/home/controls/club_controls/club_controls.dart';
import 'package:vonette_web/screens/home/controls/counselor_controls/counselor_controls.dart';
import 'package:vonette_web/screens/home/controls/user_controls/user_controls.dart';
import 'package:vonette_web/screens/home/settings/settings_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int showPages = 1;

  void togglePages(int value) {
    setState(() => showPages = value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 2,
                child: Drawer(
                  elevation: 0,
                  backgroundColor: fgColor,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        DrawerHeader(
                          child: Image.asset(
                            'assets/images/vonette_logo.png',
                            scale: 3.5,
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            togglePages(1);
                          },
                          leading: Icon(
                            Icons.person,
                            //color: iconColor,
                          ),
                          title: Text('User Controls'),
                        ),
                        ListTile(
                          onTap: () {
                            togglePages(2);
                          },
                          leading: Icon(
                            Icons.group,
                            //color: iconColor,
                          ),
                          title: Text('Counselor Controls'),
                        ),
                        ListTile(
                          onTap: () {
                            togglePages(3);
                          },
                          leading: Icon(
                            Icons.announcement,
                            //color: iconColor,
                          ),
                          title: Text('Club Controls'),
                        ),
                        ListTile(
                          onTap: () {
                            togglePages(4);
                          },
                          leading: Icon(
                            Icons.settings,
                            //color: iconColor,
                          ),
                          title: Text('Settings'),
                        ),
                        ListTile(
                          onTap: () {},
                          leading: Icon(
                            Icons.logout,
                            //color: iconColor,
                          ),
                          title: Text('Log Out'),
                        ),
                      ],
                    ),
                  ),
                )),
            Expanded(
              flex: 10,
              child: currentPage(showPages),
            )
          ],
        ),
      ),
    );
  }
}

Widget currentPage(int showPages) {
  if (showPages == 1) {
    return UserControls();
  } else if (showPages == 2) {
    return CounselorControls();
  } else if (showPages == 3) {
    return ClubControls();
  } else if (showPages == 4) {
    return SettingsPage();
  } else {
    return Container();
  }
}
