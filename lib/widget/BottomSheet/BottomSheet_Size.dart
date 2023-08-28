import 'package:flutter/material.dart';

import '../../controller/bottomsheetcontroller.dart';
import '../button.dart';


class SizeBottomsheet extends StatefulWidget {
  const SizeBottomsheet({super.key,required this.controller});
  final bottomsheetcontroller controller;

  @override
  State<SizeBottomsheet> createState() => _SizeBottomsheetState();
}

class _SizeBottomsheetState extends State<SizeBottomsheet> {
  @override
  Widget build(BuildContext context) {
    return ListView(
        children: <Widget> [
        
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 10,),
             Container(
              height: 8,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey
              ),
             ),
              const SizedBox(height: 20,),
            Text("Select size",style: Theme.of(context).textTheme.bodyLarge,),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                sizeTag("XS"),
                sizeTag("S"),
                sizeTag("M"),
                 ],
            ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    sizeTag("L"),
                    sizeTag("XL"),
                  ],
                ),
                const SizedBox(height: 30,),
                const Divider(height: 1,color: Colors.grey,),
                sizeinfo(),
                 const Divider(height: 1,color: Colors.grey,),
                  const SizedBox(height: 30,),
                 savebutton(
                  "Save",(){
                     Navigator.pop(context);
                  }
                 ),
          ],
        ),
         
        ],
       );
      
  }
   Widget sizeTag (name){
   return 
      GestureDetector(
        onTap: () {
          Navigator.pop(context,name);
        },
        child: Row(
          children: [
            Container(
                         margin: const EdgeInsets.only(left: 20,top: 10),
                        height: 40,
                        width: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(30),
                          border: Border.all(
                            color: Colors.grey,
                          )
                        ),
                        child: Center(child: Text(name,style: Theme.of(context).textTheme.bodyLarge,)),
             ),
          ],
        ),
      );
  }

  ListTile sizeinfo(){
    return ListTile(
     title: Text("Size info",style:Theme.of(context).textTheme.bodyLarge), 
     trailing: const Icon(Icons.arrow_forward_ios_outlined,color: Colors.white,),
    );
  }
  Widget savebutton(String name,VoidCallback onPressed){
    return  Button(name: name, onPressed: onPressed) ;
                  
  }
}