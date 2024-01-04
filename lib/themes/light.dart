import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 104, 134, 255),
    brightness: Brightness.light,
  ),
  textTheme: const TextTheme(),
);
