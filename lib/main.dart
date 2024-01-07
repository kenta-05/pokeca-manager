import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokeca_wallet/screens/home_screen.dart';
import 'package:pokeca_wallet/themes/light.dart';
import 'package:pokeca_wallet/themes/dark.dart';

void main() => runApp(
      const ProviderScope(
        child: App(),
      ),
    );

class App extends StatelessWidget {
  const App({super.key});

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
