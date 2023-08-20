import 'package:flutter/material.dart';

import '../../controller/bottomsheetcontroller.dart';
import '../Button.dart';

class PaymentCards extends StatefulWidget {
  const PaymentCards({super.key,required this.controller});
   final bottomsheetcontroller controller;

  @override
  State<PaymentCards> createState() => _PaymentCardsState();
}

class _PaymentCardsState extends State<PaymentCards> {

  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: Center(
          child: Column(
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
                  const SizedBox(height:10,),
              Center(child: Text("Add new card",style: Theme.of(context).textTheme.bodyLarge,)),
              const SizedBox(height: 10,),
              textField( "Name on card", Text("")),
              const SizedBox(height: 10,),
               textField( "Card number", Image.asset("Assets/card.png")),
               const SizedBox(height: 10,),
               textField( "Expire Date", Text("")),
               const SizedBox(height: 10,),
               textField( "CVV", const Icon(Icons.help_outline,color: Colors.white,)),
                const SizedBox(height: 10,),
               Row(
                children: [
                  Checkbox(
                   
                     activeColor: Colors.amber,
                    value:this.value,
                   onChanged: (value){
                     setState(() {
                       this.value = value!;
                     });
                   },
                   ),
                   const SizedBox(width: 10,),

                   Text("Set as default payment method",style: Theme.of(context).textTheme.bodyLarge,)

                ],
               ),
               const SizedBox(height: 10,),

               addCard("ADD CARD", () { 
                Navigator.pop(context);
               })
              
            ],
          ),
        ),
      ),
    );
  }
  Widget textField(hint,suffix){
  return SizedBox(
    height: 50,
    child: TextField(
              textInputAction: TextInputAction.next,
              autofocus: true,
              cursorColor:Theme.of(context).colorScheme.secondary,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 11),
              decoration: InputDecoration(
                suffix: suffix,
                fillColor: Theme.of(context).colorScheme.secondary,
                filled: true,
                hintText: hint,
                labelText: hint ,
                hintStyle:Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey,fontSize: 11),
                 labelStyle:Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey,fontSize: 11),
              focusedBorder:  OutlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary )),
              enabledBorder:  OutlineInputBorder(
                borderSide: BorderSide(color:Theme.of(context).colorScheme.secondary,))
            ),
            ),
  );
 }

 
   Widget addCard(String name,VoidCallback onPressed){
    return  Button(name: name, onPressed: onPressed) ;
                  
  }
  
}