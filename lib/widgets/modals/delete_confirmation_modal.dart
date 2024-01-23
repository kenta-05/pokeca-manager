import 'package:flutter/material.dart';

class DeleteConfirmationModal extends StatelessWidget {
  const DeleteConfirmationModal({super.key});

  @override
  Widget build(context) {
    return AlertDialog(
      title: const Text('Do you really wanna delete it?'),
      actions: [
        TextButton(
          onPressed: () {},
          child: const Text('Back'),
        ),
        TextButton(
          onPressed: () {},
          child: const Text('Delete'),
        )
      ],
    );
  }
}
