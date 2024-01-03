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
    'カード3の詳細情報',
    'カード3の詳細情報',
    'カード3の詳細情報',
    'カード3の詳細情報',
    // 他のカードデータを追加
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: (cardData.length / 3).ceil(), // カードデータの数を3で割り、切り上げることで行数を計算
      itemBuilder: (BuildContext context, int row) {
        return Row(
          children: [
            // カード1
            if (row * 3 < cardData.length)
              Expanded(
                child: Card(
                  elevation: 4.0,
                  child: ListTile(
                    title: Text('カード ${row * 3 + 1}'),
                    subtitle: Text(cardData[row * 3]),
                  ),
                ),
              ),
            // カード2
            if (row * 3 + 1 < cardData.length)
              Expanded(
                child: Card(
                  elevation: 4.0,
                  child: ListTile(
                    title: Text('カード ${row * 3 + 2}'),
                    subtitle: Text(cardData[row * 3 + 1]),
                  ),
                ),
              ),
            // カード3
            if (row * 3 + 2 < cardData.length)
              Expanded(
                child: Card(
                  elevation: 4.0,
                  child: ListTile(
                    title: Text('カード ${row * 3 + 3}'),
                    subtitle: Text(cardData[row * 3 + 2]),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
