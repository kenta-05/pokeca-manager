import 'package:flutter/material.dart';
import 'package:pokeca_wallet/widgets/layout/control_panel.dart';
import 'package:pokeca_wallet/widgets/layout/poke_cards.dart';

class CardsView extends StatefulWidget {
  const CardsView({super.key});

  @override
  State<CardsView> createState() => _CardsViewState();
}

class _CardsViewState extends State<CardsView> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ControlPanel(),
        PokeCards(),
      ],
    );
  }
}
