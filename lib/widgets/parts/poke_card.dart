import 'package:flutter/material.dart';
import 'package:pokeca_wallet/models/card_data.dart';

class PokeCard extends StatelessWidget {
  const PokeCard(this.cardData, {super.key});

  final CardData cardData;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      alignment: Alignment.topCenter,
      child: Container(
        width: 130,
        height: 100,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(cardData.title),
              Text(cardData.packName),
              Text(cardData.cost.toString()),
              // 他のTextウィジェットを追加可能
            ],
          ),
        ),
      ),
    );
  }
}
