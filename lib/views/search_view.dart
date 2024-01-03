import 'package:flutter/material.dart';
import 'package:pokeca_wallet/widgets/large/search_results.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return const SearchResults();
  }
}
