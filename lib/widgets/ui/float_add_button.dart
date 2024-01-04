import 'package:flutter/material.dart';

class FloatAddButton extends StatelessWidget {
  const FloatAddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 80,
      child: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        elevation: 10.0,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        child: Icon(
          Icons.add,
          size: 40.0,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
