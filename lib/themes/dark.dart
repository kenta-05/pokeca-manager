import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 46, 61, 120),
    brightness: Brightness.dark,
  ),
  textTheme: const TextTheme(),
);
