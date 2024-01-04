import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 73, 109, 255),
    brightness: Brightness.light,
  ).copyWith(
    primaryContainer: Colors.white, // ここでprimaryContainerの色を上書き
  ),
  textTheme: const TextTheme(),
);
