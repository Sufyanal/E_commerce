import 'package:flutter/material.dart';

import '../../controller/bottomsheetcontroller.dart';

class Shortby extends StatefulWidget {
  const Shortby({super.key,required this.controller});
   final bottomsheetcontroller controller;

  @override
  State<Shortby> createState() => _ShortbyState();
}

class _ShortbyState extends State<Shortby> {
   bool selectitem = false;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         mainAxisAlignment: MainAxisAlignment.start,
          children: [
              const SizedBox(height: 10,),
             Center(
               child: Container(
                height: 8,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey
                ),
               ),
             ),
                const SizedBox(height: 20,),
            Center(child: Text("Sort by",style: Theme.of(context).textTheme.bodyLarge,)),
            const SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _shortby("Popular"),
                  const SizedBox(height: 20,),
                  _shortby("Newest"),
                   const SizedBox(height: 20,),
                  _shortby("Customer review"),
                   const SizedBox(height: 20,),
                  _shortby("Price: lowest to high"),
                   const SizedBox(height: 20,),
                  _shortby("Price: highest to low"),
            
                ],
              ),
            )
          ],
        )
      ],
    );
  }
   Widget _shortby (name){
   return 
      InkWell(
        child: 
        ListTile(
          tileColor: selectitem ? Colors.blue : null, 
          title: Text(name,style: Theme.of(context).textTheme.bodyLarge,)),
           onTap: () {
          Navigator.pop(context,name);
        },
      );
  }
}