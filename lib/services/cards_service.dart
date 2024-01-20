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
    // get cards from subcollection("cards") of user document by deviceId
    try {
      final deviceId = await Util.getDeviceId();
      final userDocRef = FirebaseSetup.getUserDocRef(deviceId);

      QuerySnapshot cardsQuerySnapshot =
          await userDocRef.collection("cards").get();
      List<DocumentSnapshot> documentSnapshots = cardsQuerySnapshot.docs;

      // extract actual data from DocumentSnapshot list
      List<Map<String, dynamic>> cardsDataList =
          documentSnapshots.map((snapshot) {
        return snapshot.data() as Map<String, dynamic>;
      }).toList();
      return cardsDataList;
    } catch (e) {
      print("Error getting document: $e");
      return [{}];
    }
  }
}
