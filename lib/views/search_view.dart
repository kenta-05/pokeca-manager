import 'package:flutter/material.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final List<String> cardData = [
    'カード1の詳細情報',
    'カード2の詳細情報',
    'カード3の詳細情報',
    'カード4の詳細情報',
    'カード5の詳細情報',
    'カード6の詳細情報',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: (cardData.length / 3).ceil(),
      itemBuilder: (context, int index) {
        return Row(
          children: [
            // カード1
            if (index * 3 + 1 <= cardData.length)
              Expanded(
                child: Card(
                  child: ListTile(
                    title: Text('カード ${index * 3 + 1}'),
                    subtitle: Text(cardData[index * 3]),
                  ),
                ),
              ),
            // カード2
            if (index * 3 + 2 <= cardData.length)
              Expanded(
                child: Card(
                  child: ListTile(
                    title: Text('カード ${index * 3 + 2}'),
                    subtitle: Text(cardData[index * 3 + 1]),
                  ),
                ),
              ),
            // カード3
            if (index * 3 + 3 <= cardData.length)
              Expanded(
                child: Card(
                  child: ListTile(
                    title: Text('カード ${index * 3 + 3}'),
                    subtitle: Text(cardData[index * 3 + 2]),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
