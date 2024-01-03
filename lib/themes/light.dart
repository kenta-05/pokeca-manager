import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 99, 130, 255),
    brightness: Brightness.light,
  ),
  textTheme: const TextTheme(),
);
