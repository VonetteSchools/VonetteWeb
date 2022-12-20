import 'package:vonette_web/screens/controls/club_controls/club_controls.dart';
import 'package:vonette_web/screens/controls/user_controls/user_controls.dart';
import 'package:vonette_web/screens/settings/settings_screen.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Toggle extends StatefulWidget {
  const Toggle({Key? key}) : super(key: key);

  @override
  State<Toggle> createState() => _ToggleState();
}

class _ToggleState extends State<Toggle> {
  int showPages = 1;

  void togglePages(int value) {
    setState(() => showPages = value);
  }

  @override
  Widget build(BuildContext context) {
    if (showPages == 1) {
      return UserControls();
    } else if (showPages == 2) {
      return ClubControls();
    } else if (showPages == 3) {
      return SettingsPage();
    } else {
      return Container();
    }
  }
}
