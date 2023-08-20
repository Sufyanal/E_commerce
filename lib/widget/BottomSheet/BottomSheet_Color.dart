import 'package:flutter/material.dart';

import '../../controller/bottomsheetcontroller.dart';
class colornamesheet extends StatefulWidget {
  const colornamesheet({super.key,required this.controller});

  final bottomsheetcontroller controller;

  @override
  State<colornamesheet> createState() => _colornamesheetState();
}

class _colornamesheetState extends State<colornamesheet> {
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