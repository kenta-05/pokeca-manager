import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokeca_wallet/models/card_data.dart';
import 'package:pokeca_wallet/providers/add_modal_provider.dart';
import 'package:pokeca_wallet/providers/device_id_provider.dart';
import 'package:pokeca_wallet/services/firebase_setup.dart';

class AddModal extends ConsumerStatefulWidget {
  const AddModal({super.key});

  @override
  ConsumerState<AddModal> createState() => _AddModalState();
}

class _AddModalState extends ConsumerState<AddModal> {
  @override
  Widget build(BuildContext context) {
    final cardData = ref.watch(addModalProvider);
    final deviceId = ref.watch(deviceIdProvider).when(
          data: (String? value) => value,
          loading: () => null,
          error: (e, stack) => null,
        );

    // カメラ機能はいずれ実装
    // Future<void> _takePhoto() async {
    //   final ImagePicker picker = ImagePicker();

    //   try {
    //     final XFile? photo = await picker.pickImage(source: ImageSource.camera);

    //     if (photo != null) {
    //       // Convert to Uint8List
    //       Uint8List imageBytes = await photo.readAsBytes();
    //       // Handle the imageBytes
    //     } else {
    //       // User canceled the picker or the operation failed
    //     }
    //   } catch (e) {
    //     print("Error taking photo: $e");
    //     // Handle the error, maybe show an alert to the user
    //   }
    // }

    void saveCardData(CardData cardData) {
      // final db = getFirestoreInstance();
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      final jsonCardData = cardData.toJson();

      firestore
          .collection("users")
          .doc(deviceId)
          .collection("cards")
          .add(jsonCardData)
          .then((docRef) => print("Document added with ID: ${docRef.id}"))
          .catchError((error) => print("Error adding document: $error"));

      cardData.copyWith(
        title: '',
        packName: '',
        cost: null,
        imageData: null,
      );
    }

    return Dialog(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        width: double.infinity,
        child: IntrinsicHeight(
          child: Column(
            children: [
              // カメラ機能はいずれ実装
              // Align(
              //   alignment: Alignment.topLeft,
              //   child: OutlinedButton.icon(
              //     icon: const Icon(Icons.camera_alt),
              //     label: const Text('Take Photo'),
              //     onPressed: () async {
              //       await _takePhoto();
              //     },
              //   ),
              // ),
              TextFormField(
                initialValue: cardData.title,
                decoration: const InputDecoration(labelText: 'Title'),
                onChanged: (value) =>
                    ref.read(addModalProvider.notifier).setTitle(value),
              ),
              TextFormField(
                initialValue: cardData.packName,
                decoration: const InputDecoration(labelText: 'Pack Name'),
                onChanged: (value) =>
                    ref.read(addModalProvider.notifier).setPackName(value),
              ),
              TextFormField(
                initialValue: cardData.packName,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Cost'),
                onChanged: (value) => int.tryParse(value) != null
                    ? ref.read(addModalProvider.notifier).setPackName(value)
                    : null,
              ),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    saveCardData(cardData);
                    Navigator.pop(context);
                  },
                  child: const Text('Add'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
