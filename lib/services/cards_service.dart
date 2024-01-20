import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pokeca_wallet/services/firebase_setup.dart';
import 'package:pokeca_wallet/services/util.dart';

class CardsService {
  static void addCards(jsonCardData) async {
    final deviceId = await Util.getDeviceId();
    final db = FirebaseSetup.db;

    db
        .collection("users")
        .doc(deviceId)
        .collection("cards")
        .add(jsonCardData)
        .then((docRef) => print("Document added with ID: ${docRef.id}"))
        .catchError((error) => print("Error adding document: $error"));
  }

  static Future<List<Map<String, dynamic>>> getCards() async {
    try {
      final deviceId = await Util.getDeviceId();
      final userDocRef = FirebaseSetup.getUserDocRef(deviceId);

      DocumentSnapshot doc = await userDocRef.get();
      return doc.data() as List<Map<String, dynamic>>;
    } catch (e) {
      print("Error getting document: $e");
      return [{}];
    }
  }
}
