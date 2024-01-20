import 'package:flutter/material.dart';
import 'package:pokeca_wallet/models/card_data.dart';

class PokeCard extends StatelessWidget {
  const PokeCard(this.cardData, {super.key});

  final CardData cardData;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(cardData.title),
        subtitle: Text(cardData.packName),
      ),
    );
  }
}
