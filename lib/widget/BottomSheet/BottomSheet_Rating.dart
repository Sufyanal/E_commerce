
import 'package:ecommerce/model.dart/Review.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart';

import 'package:http/http.dart' as http;

import '../../controller/bottomsheetcontroller.dart';
import '../../model.dart/Product_modals.dart';

class RatingSheet extends StatefulWidget {

  const RatingSheet({super.key,required this.controller,});
   final bottomsheetcontroller controller;
  
  @override
  State<RatingSheet> createState() => _RatingSheetState();
}

class _RatingSheetState extends State<RatingSheet> {
  ProductsReview? reviews;
  double rating = 0.0; // Add this variable to store the selected rating
  String reviewText = ''; 
 void postReview() async {
  try {
      http.Response response = await post(
          Uri.parse('https://ecommerce.salmanbediya.com/products/review/add'),
          body: {
          'product': widget.controller.toString(), 
          'user': widget.controller.toString(), 
          'rating': rating.toString(),
          'reviewText': reviewText, });
    if (response.statusCode == 200) {
    
     setState(() {
       Navigator.pop(context);
     });
      

        
      } else {
      
      }
    // ignore: empty_catches
    } catch (e) {
 
    }}
  

   Product? product;
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
   initialRating: double.parse(product!.rating!),
   minRating: 1,
   direction: Axis.horizontal,
   allowHalfRating: true,
   itemCount: 5,
   itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
   itemBuilder: (context, _) => const Icon(
     Icons.star,
     color: Colors.white,
   ),
   onRatingUpdate: (rating) {
     
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
              postReview();
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