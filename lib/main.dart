import 'package:flutter/material.dart';
import 'package:pokeca_wallet/screens/home_screen.dart';
import 'package:pokeca_wallet/themes/light.dart';
import 'package:pokeca_wallet/themes/dark.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      title: 'Pokeca Wallet',
      home: const HomeScreen(),
    );
  }
}
