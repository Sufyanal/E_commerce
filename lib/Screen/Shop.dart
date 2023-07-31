// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';


class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  int currentIndex = 0;
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff1E1F28),
      appBar: AppBar(),
     body: Column(
      children: [
        Text("data")
      ],
     ),

    );
  }


}