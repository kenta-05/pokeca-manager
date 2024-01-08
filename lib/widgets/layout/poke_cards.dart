import 'package:flutter/material.dart';
import 'package:pokeca_wallet/models/card_data.dart';
import 'package:pokeca_wallet/widgets/parts/poke_card.dart';

class PokeCards extends StatelessWidget {
  const PokeCards({super.key});

  static List<CardData> cardData = [
    CardData(title: '', packName: '', cost: 0),
    CardData(title: '', packName: '', cost: 0),
    CardData(title: '', packName: '', cost: 0),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: (cardData.length / 3).ceil(),
        itemBuilder: (context, int index) {
          return Row(
            children: [
              // カード1
              if (index * 3 + 1 <= cardData.length)
                Expanded(
                  child: PokeCard(cardData[index * 3]),
                ),
              // カード2
              if (index * 3 + 2 <= cardData.length)
                Expanded(
                  child: PokeCard(cardData[index * 3]),
                ),
              // カード3
              if (index * 3 + 3 <= cardData.length)
                Expanded(
                  child: PokeCard(cardData[index * 3]),
                ),
            ],
          );
        },
      ),
    );
  }
}
