import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pokeca_wallet/firebase_options.dart';

class FirebaseSetup {
  Future<void> initializeFirebase() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  final FirebaseFirestore db = FirebaseFirestore.instance;

  DocumentReference getUserDocRef(currentUid) {
    return FirebaseFirestore.instance.collection("users").doc(currentUid);
  }
}
