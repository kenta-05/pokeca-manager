import 'package:flutter/material.dart';
import 'package:pokeca_wallet/views/cards_view.dart';
import 'package:pokeca_wallet/widgets/layout/nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final pageController = PageController(initialPage: 0);
  int _currentIndex = 0;

  @override
  void initState() {
    pageController.addListener(() {
      if (pageController.page != null) {
        setState(() {
          _currentIndex = pageController.page!.round();
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.removeListener(() {});
    pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int nextIndex) {
    setState(() {
      _currentIndex = nextIndex;
      pageController.animateToPage(
        nextIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokeca Wallet'),
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          const CardsView(),
          Container(
            color: Colors.blue,
          ),
        ],
      ),
      bottomNavigationBar: NavBar(
        currentIndex: _currentIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
