
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';



import '../../controller/bottomsheetcontroller.dart';

class RatingSheet extends StatefulWidget {

  const RatingSheet({super.key,required this.controller});
   final bottomsheetcontroller controller;
  @override
  State<RatingSheet> createState() => _RatingSheetState();
}

class _RatingSheetState extends State<RatingSheet> {



  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
  backgroundColor: Theme.of(context).colorScheme.primary,
      body:   Center(
        child: Column(
          children: [
             const SizedBox(height: 20,),
              Container(
                height: 8,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey
                ),
               ),
               const SizedBox(height: 20,),
            Text("What is you rate?",style: Theme.of(context).textTheme.bodyLarge,),
            const SizedBox(height: 30,),
            RatingBar.builder(
                               initialRating: 0,
                                 minRating: 0,
                                 unratedColor: Colors.white,
                                     direction: Axis.horizontal,
                                allowHalfRating: true,
                                  itemCount: 5,
                                 itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => const Icon(
                                   Icons.star,
                                   color: Colors.amber,
                                        ),
                                 onRatingUpdate: (rating) {
                                    print(rating);
                               },
                                   ),

                       Text("Please share your opinion\nabout the product"
                       ,style: Theme.of(context).textTheme.bodyLarge), 
                  const SizedBox(height: 20,),
                  SizedBox(
                  width: 330,
                   height: 150,
                child: TextField(
                  onChanged: (reviews){
           
                  },
                  onSubmitted: (reviews){
                    
                  },
                  style: const TextStyle(color: Colors.white),
                 maxLines: null,
                  expands: true,
                keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      fillColor: Theme.of(context).colorScheme.secondary,
                      filled: true ,
                       hintText: 'Enter a message',
                       hintStyle: const TextStyle(color: Colors.white),),
                       autofocus: true, ),
),
         const SizedBox(height: 9,),
          GestureDetector(
            onTap: (){
              
            },
            child: Container(
              height: 50,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Theme.of(context).colorScheme.error
              ),
              child: Center(child: Text("SEND REVIEW",style: Theme.of(context).textTheme.bodyLarge,)),
            ),
          )
          ],
        ),
      ),
    );
  }
}