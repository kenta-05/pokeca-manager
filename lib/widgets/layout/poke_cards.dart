import 'package:flutter/material.dart';
import 'package:pokeca_wallet/models/card_data.dart';
import 'package:pokeca_wallet/services/cards_service.dart';
import 'package:pokeca_wallet/widgets/parts/poke_card.dart';

class PokeCards extends StatelessWidget {
  const PokeCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<List<Map<String, dynamic>>>(
        future: CardsService.getCards(),
        builder: (BuildContext context,
            AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error'));
          } else if (snapshot.hasData) {
            return GridView.builder(
              padding: const EdgeInsets.all(6),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 6,
                mainAxisSpacing: 6,
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return PokeCard(CardData.fromMap(snapshot.data![index]));
              },
            );
          }
          return const Center(child: Text('Unknown Error'));
        },
      ),
    );
  }
}
