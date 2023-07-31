import 'package:flutter/material.dart';

class Bags extends StatefulWidget {
  const Bags({super.key});

  @override
  State<Bags> createState() => _BagsState();
}

class _BagsState extends State<Bags> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
    );
    
  }
}