import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 99, 130, 255),
    brightness: Brightness.dark,
  ),
  textTheme: const TextTheme(),
);
