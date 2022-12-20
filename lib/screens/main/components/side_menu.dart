import 'package:vonette_web/constants.dart';
import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  final Function togglePage;
  const SideMenu({
    Key? key,
    required this.togglePage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                togglePage(1);
              },
              leading: Icon(
                Icons.group,
                //color: iconColor,
              ),
              title: Text('User Controls'),
            ),
            ListTile(
              onTap: () {
                togglePage(2);
              },
              leading: Icon(
                Icons.announcement,
                //color: iconColor,
              ),
              title: Text('Club Controls'),
            ),
            ListTile(
              onTap: () {
                togglePage(3);
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
    );
  }
}
