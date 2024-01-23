import 'package:flutter/material.dart';
import 'package:pokeca_wallet/widgets/modals/delete_confirmation_modal.dart';

class EditModal extends StatefulWidget {
  const EditModal({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _EditModalState createState() => _EditModalState();
}

class _EditModalState extends State<EditModal> {
  String titleValue = '';
  String packNameValue = '';
  String costValue = '';

  @override
  Widget build(context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            initialValue: titleValue,
            decoration: const InputDecoration(labelText: 'Title'),
            onChanged: (value) => titleValue = value,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter some text.';
              } else if (value.length > 25) {
                return 'Title must be less than 25 characters.';
              }
              return null;
            },
          ),
          TextFormField(
            initialValue: packNameValue,
            decoration: const InputDecoration(labelText: 'Pack Name'),
            onChanged: (value) => packNameValue = value,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter some text.';
              } else if (value.length > 25) {
                return 'Pack Name must be less than 25 characters.';
              }
              return null;
            },
          ),
          TextFormField(
            initialValue: costValue,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Cost'),
            onChanged: (value) => costValue = value,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter some text.';
              } else if (double.tryParse(value) == null) {
                return 'Cost must be an integer.';
              }
              return null;
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            showDialog(
                context: context,
                builder: (context) {
                  return const DeleteConfirmationModal();
                });
          },
          child: const Text('Delete'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Edit'),
        ),
      ],
    );
  }
}
