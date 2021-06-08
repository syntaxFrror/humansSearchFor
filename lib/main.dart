import 'package:flutter/material.dart';
import 'screens/main_menu.dart';
import 'package:things_humans_google/constants.dart';

void main() {
  runApp(ThingsHumansSearch());
}

class ThingsHumansSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          foregroundColor: foregroundColor,
          backgroundColor: backgroundColor,
        ),
        primaryColor: primaryColor,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
      ),
      home: MainMenu(),
    );
  }
}
