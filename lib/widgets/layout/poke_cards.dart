import 'package:flutter/material.dart';
import 'package:pokeca_wallet/models/card_data.dart';
import 'package:pokeca_wallet/widgets/parts/poke_card.dart';

class PokeCards extends StatelessWidget {
  const PokeCards({super.key});

  static List<CardData> cardData = [
    CardData(title: 'test1', packName: 'test1', cost: 0),
    CardData(title: 'test2', packName: 'test2', cost: 0),
    CardData(title: 'test3', packName: 'test3', cost: 0),
    CardData(title: 'test4', packName: 'test4', cost: 0),
    CardData(title: 'test5', packName: 'test5', cost: 0),
    CardData(title: 'test6', packName: 'test6', cost: 0),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.all(6),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 6,
          mainAxisSpacing: 6,
        ),
        itemCount: cardData.length,
        itemBuilder: (context, index) {
          return PokeCard(cardData[index]);
        },
      ),
    );
  }
}
