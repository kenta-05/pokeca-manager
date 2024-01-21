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
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.black12,
            width: 2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(cardData.title,
                  style: Theme.of(context).textTheme.titleMedium),
              Text(cardData.packName,
                  style: Theme.of(context).textTheme.titleSmall),
              const Spacer(),
              Text('${cardData.cost}円',
                  style: Theme.of(context).textTheme.titleMedium),
            ],
          ),
        ),
      ),
    );
  }
}
