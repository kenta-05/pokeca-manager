import 'package:pokeca_wallet/services/firebase_setup.dart';
import 'package:pokeca_wallet/services/util.dart';

class CardsService {
  final db = FirebaseSetup.db;

  void addCards(jsonCardData) async {
    final deviceId = await Util.getDeviceId();

    db
        .collection("users")
        .doc(deviceId)
        .collection("cards")
        .add(jsonCardData)
        .then((docRef) => print("Document added with ID: ${docRef.id}"))
        .catchError((error) => print("Error adding document: $error"));
  }
}
