import 'package:flutter/material.dart';
import 'package:pokeca_wallet/widgets/ui/search_box.dart';
import 'package:pokeca_wallet/widgets/ui/select_order.dart';
import 'package:pokeca_wallet/widgets/ui/add_card.dart';

class ControlPanel extends StatelessWidget {
  const ControlPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 16,
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SearchBox(),
          SelectOrder(),
          AddCard(),
        ],
      ),
    );
  }
}
