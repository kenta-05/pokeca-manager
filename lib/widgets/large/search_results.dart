import 'package:flutter/material.dart';
import 'package:pokeca_wallet/models/card_data.dart';
import 'package:pokeca_wallet/widgets/middle/poke_card.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({super.key});

  static List<CardData> cardData = [
    CardData(title: 'test', packName: 'test', image: 'test', url: 'test'),
    CardData(title: 'test', packName: 'test', image: 'test', url: 'test'),
    CardData(title: 'test', packName: 'test', image: 'test', url: 'test'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: (cardData.length / 3).ceil(),
      itemBuilder: (context, int index) {
        return Row(
          children: [
            if (index * 3 + 1 <= cardData.length)
              Expanded(child: PokeCard(cardData[index * 3])),
            if (index * 3 + 2 <= cardData.length)
              Expanded(child: PokeCard(cardData[index * 3 + 1])),
            if (index * 3 + 3 <= cardData.length)
              Expanded(child: PokeCard(cardData[index * 3 + 2])),
          ],
        );
      },
    );
  }
}
