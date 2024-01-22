import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokeca_wallet/models/card_data.dart';
import 'package:pokeca_wallet/providers/add_modal_provider.dart';
import 'package:pokeca_wallet/services/cards_service.dart';

class AddModal extends ConsumerStatefulWidget {
  const AddModal({super.key});

  @override
  ConsumerState<AddModal> createState() => _AddModalState();
}

class _AddModalState extends ConsumerState<AddModal> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final cardData = ref.watch(addModalProvider);

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
      final jsonCardData = cardData.toJson();
      CardsService.addCards(jsonCardData);

      ref.read(addModalProvider.notifier).reset();
      Navigator.pop(context);
    }

    void onAddCard() {
      final form = _formKey.currentState;
      if (form!.validate()) {
        saveCardData(cardData);
      }
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
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // TODO: カメラ機能はいずれ実装
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
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return 'Please enter some text.';
                    } else if (value.length > 25) {
                      return 'Title must be less than 25 characters.';
                    }
                    return null;
                  }),
                ),
                TextFormField(
                  initialValue: cardData.packName,
                  decoration: const InputDecoration(labelText: 'Pack Name'),
                  onChanged: (value) =>
                      ref.read(addModalProvider.notifier).setPackName(value),
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return 'Please enter some text.';
                    } else if (value.length > 25) {
                      return 'Pack Name must be less than 25 characters.';
                    }
                    return null;
                  }),
                ),
                TextFormField(
                  initialValue: cardData.packName,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Cost'),
                  onChanged: (value) => int.tryParse(value) != null
                      ? ref
                          .read(addModalProvider.notifier)
                          .setCost(int.parse(value))
                      : null,
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return 'Please enter some text.';
                    } else if (double.tryParse(value) == null) {
                      return 'Cost must be an integer.';
                    }
                    return null;
                  }),
                ),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: onAddCard,
                    child: const Text('Add'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
