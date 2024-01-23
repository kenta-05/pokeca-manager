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
        .add({...jsonCardData, 'createdAt': FieldValue.serverTimestamp()})
        .then((docRef) => print("Document added with ID: ${docRef.id}"))
        .catchError((error) => print("Error adding document: $error"));
  }

  static Stream<List<Map<String, dynamic>>> getCards() async* {
    // get cards from subcollection("cards") of user document by deviceId
    try {
      final deviceId = await Util.getDeviceId();
      final userDocRef = FirebaseSetup.getUserDocRef(deviceId);

      // extract actual data from DocumentSnapshot list
      yield* userDocRef
          .collection("cards")
          .orderBy('createdAt', descending: true)
          .snapshots()
          .map((snapshot) {
        return snapshot.docs.map((doc) => doc.data()).toList();
      });
    } catch (e) {
      print("Error getting document: $e");
      yield [{}];
    }
  }

  static void deleteCard(String cardDocId) {
    final db = FirebaseSetup.db;

    db.collection("cards").doc(cardDocId).delete().then(
          (doc) => print("Document deleted"),
          onError: (e) => print("Error updating document $e"),
        );
  }
}
