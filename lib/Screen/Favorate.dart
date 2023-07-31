import 'package:flutter/material.dart';

class Favorate extends StatefulWidget {
  const Favorate({super.key});

  @override
  State<Favorate> createState() => _FavorateState();
}

class _FavorateState extends State<Favorate> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
    );
  }
}