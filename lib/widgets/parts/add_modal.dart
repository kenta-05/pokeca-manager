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

    return AlertDialog(
      title: Text('Edit Card Data'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            TextFormField(
                initialValue: cardData.title,
                decoration: InputDecoration(labelText: 'Title'),
                onChanged: (value) =>
                    ref.read(addModalProvider.notifier).setTitle(value)),
            TextFormField(
              initialValue: cardData.packName,
              decoration: InputDecoration(labelText: 'Pack Name'),
              onChanged: (value) =>
                  ref.read(addModalProvider.notifier).setPackName(value),
            ),
            TextFormField(
              initialValue: cardData.image,
              decoration: InputDecoration(labelText: 'Image URL'),
              onChanged: (value) =>
                  ref.read(addModalProvider.notifier).setImage(value),
            ),
            TextFormField(
              initialValue: cardData.url,
              decoration: InputDecoration(labelText: 'External URL'),
              onChanged: (value) =>
                  ref.read(addModalProvider.notifier).setUrl(value),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Cancel'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        TextButton(
          child: Text('Save'),
          onPressed: () {
            // 必要に応じて保存ロジックをここに追加
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
