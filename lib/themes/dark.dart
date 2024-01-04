import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 46, 61, 120),
    brightness: Brightness.dark,
  ).copyWith(
    primaryContainer: Colors.black54, // ここでprimaryContainerの色を上書き
  ),
  textTheme: const TextTheme(),
);
