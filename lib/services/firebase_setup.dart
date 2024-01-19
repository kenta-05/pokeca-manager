import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pokeca_wallet/firebase_options.dart';

class FirebaseSetup {
  static Future<void> initializeFirebase() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  static final FirebaseFirestore db = FirebaseFirestore.instance;

  static DocumentReference getUserDocRef(currentUid) {
    return db.collection("users").doc(currentUid);
  }
}
