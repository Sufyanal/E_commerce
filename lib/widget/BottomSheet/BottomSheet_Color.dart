import 'package:flutter/material.dart';

import '../../controller/bottomsheetcontroller.dart';
class Colornamesheet extends StatefulWidget {
  const Colornamesheet({super.key,required this.controller});

  final bottomsheetcontroller controller;

  @override
  State<Colornamesheet> createState() => _ColornamesheetState();
}

class _ColornamesheetState extends State<Colornamesheet> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          const SizedBox(height: 10,),
          _name("Black"),
     const SizedBox(height: 10,),
          const Divider(height: 1,color: Colors.grey,),
           _name("White"),
            const SizedBox(height: 10,),
          const Divider(height: 1,color: Colors.grey,),
           _name("Red"),
            const SizedBox(height: 10,),
          const Divider(height: 1,color: Colors.grey,),
           _name("Blue"),
             const SizedBox(height: 10,),
          const Divider(height: 1,color: Colors.grey,),
           _name("Red"),
             const SizedBox(height: 10,),
          const Divider(height: 1,color: Colors.grey,),
           _name("Green"),
             const SizedBox(height: 10,),
          const Divider(height: 1,color: Colors.grey,),
        ],
      ),
    );
  }

  Widget _name(name){
    return GestureDetector(
      onTap: () {
        Navigator.pop(context,name);
      },
      child: ListTile(
        title: Text(name,style: Theme.of(context).textTheme.bodyLarge,),
      ),
    );
  }
}