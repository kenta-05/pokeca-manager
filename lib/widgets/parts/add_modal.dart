import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokeca_wallet/providers/add_modal_provider.dart';

class AddModal extends ConsumerStatefulWidget {
  const AddModal({super.key});

  @override
  ConsumerState<AddModal> createState() => _AddModalState();
}

class _AddModalState extends ConsumerState<AddModal> {
  @override
  Widget build(BuildContext context) {
    final cardData = ref.watch(addModalProvider);

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
              Align(
                alignment: Alignment.topLeft,
                child: OutlinedButton.icon(
                  icon: const Icon(Icons.camera_alt),
                  label: const Text('Take Photo'),
                  onPressed: () {},
                ),
              ),
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
