import 'package:pokeca_wallet/models/card_data.dart';
import 'package:riverpod/riverpod.dart';

class AddModalNotifier extends StateNotifier<CardData> {
  AddModalNotifier()
      : super(CardData(title: '', packName: '', image: '', url: ''));

  void setTitle(String title) {
    state = state.copyWith(title: title);
  }

  void setPackName(String packName) {
    state = state.copyWith(packName: packName);
  }

  void setImage(String image) {
    state = state.copyWith(image: image);
  }

  void setUrl(String url) {
    state = state.copyWith(url: url);
  }
}

final addModalProvider =
    StateNotifierProvider<AddModalNotifier, CardData>((ref) {
  return AddModalNotifier();
});
