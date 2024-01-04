import 'package:flutter/material.dart';
import 'package:pokeca_wallet/widgets/large/poke_cards.dart';

class CardsView extends StatefulWidget {
  const CardsView({super.key});

  @override
  State<CardsView> createState() => _CardsViewState();
}

class _CardsViewState extends State<CardsView> {
  @override
  Widget build(BuildContext context) {
    return const PokeCards();
  }
}
