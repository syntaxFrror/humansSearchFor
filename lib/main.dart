import 'package:flutter/material.dart';
import 'screens/main_menu.dart';

void main() {
  runApp(ThingsHumansSearch());
}

class ThingsHumansSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          foregroundColor: Colors.black,
          backgroundColor: Color(0xffFFC107),
        ),
        // primaryColorDark: Color(0xD32F2F),
        // primaryColorLight: Color(0xFFCDD2),
        primaryColor: Color(0xffF44336),
        // accentColor: Color(0xfFFC107),
        // dividerColor: Color(0xBDBDBD),
        scaffoldBackgroundColor: Color(0xffff564e),
      ),
      home: MainMenu(),
    );
  }
}
