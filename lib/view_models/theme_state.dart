import 'package:flutter/material.dart';

import '../constants/colors.dart';

class ThemeState {
  final ThemeData themeData;

  ThemeState(this.themeData);

  static ThemeState get darkTheme => ThemeState(ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: blueColor),
        useMaterial3: true,
        scaffoldBackgroundColor: darkScaffoldBackgroundColor,
        bottomAppBarTheme: const BottomAppBarTheme(
          color: darkScaffoldBackgroundColor,
        ),
        textTheme: const TextTheme(),
      ));

  static ThemeState get lightTheme => ThemeState(ThemeData.light().copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: blueColor),
        useMaterial3: true,
      ));
}
