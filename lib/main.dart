import 'package:vonette_web/app_theme/theme_manager.dart';
import 'package:vonette_web/constants.dart';
import 'package:vonette_web/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scaled_app/scaled_app.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  return runApp(ChangeNotifierProvider<ThemeNotifier>(
    create: (_) => new ThemeNotifier(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, theme, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Vonette Schools Admin',
        theme: theme.getTheme(),
        home: MainScreen(),
      ),
    );
  }
}
