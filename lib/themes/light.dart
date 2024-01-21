import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 73, 109, 255),
    brightness: Brightness.light,
  ).copyWith(
    primaryContainer:
        const Color.fromARGB(255, 241, 242, 255), // ここでprimaryContainerの色を上書き
  ),
  textTheme: const TextTheme(
    titleMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    titleSmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: Color.fromARGB(255, 84, 84, 84),
    ),
  ),
);
