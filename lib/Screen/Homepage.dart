import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
       appBar: AppBar(
        elevation: 0,
        leading: InkWell(
          onTap: () {
            // Navigator.push(context, MaterialPageRoute(builder:(context)=>const Singup()));
          },
          child: Icon(Icons.arrow_back_ios,color: Colors.white,)),
      ),
    );
  }
}