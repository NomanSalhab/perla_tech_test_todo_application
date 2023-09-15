import 'package:flutter/material.dart';

import '../constants/colors.dart';

class AppTheme {
  final ThemeData darkTheme = ThemeData.dark().copyWith(
    colorScheme: ColorScheme.fromSeed(seedColor: blueColor),
    useMaterial3: true,
    scaffoldBackgroundColor: darkScaffoldBackgroundColor,
    bottomAppBarTheme: const BottomAppBarTheme(
      color: darkScaffoldBackgroundColor,
    ),
    textTheme: const TextTheme(),
  );

  final ThemeData lightTheme = ThemeData.light().copyWith(
    colorScheme: ColorScheme.fromSeed(seedColor: blueColor),
    useMaterial3: true,
  );
}
