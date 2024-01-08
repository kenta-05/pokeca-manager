import 'dart:typed_data';

import 'package:pokeca_wallet/models/card_data.dart';
import 'package:riverpod/riverpod.dart';

class AddModalNotifier extends StateNotifier<CardData> {
  AddModalNotifier()
      : super(CardData(
          title: '',
          packName: '',
          cost: 0,
          imageData: null,
        ));

  void setTitle(String title) {
    state = state.copyWith(title: title);
  }

  void setPackName(String packName) {
    state = state.copyWith(packName: packName);
  }

  void setCost(int cost) {
    state = state.copyWith(cost: cost);
  }

  void setImageData(Uint8List imageData) {
    state = state.copyWith(imageData: imageData);
  }
}

final addModalProvider =
    StateNotifierProvider<AddModalNotifier, CardData>((ref) {
  return AddModalNotifier();
});
