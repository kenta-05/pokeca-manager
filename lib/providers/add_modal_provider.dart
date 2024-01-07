import 'package:pokeca_wallet/models/card_data.dart';
import 'package:riverpod/riverpod.dart';

final addModalProvider = Provider((ref) {
  return CardData(title: '', packName: '', image: '', url: '');
});
