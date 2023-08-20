import 'package:ecommerce/controller/bottomsheetcontroller.dart';

import 'package:flutter/material.dart';


import '../../main.dart';
import '../../widget/BottomSheet/BottomSheet_Rating.dart';

class Rating extends StatefulWidget {
  const Rating({super.key, });

  @override
  State<Rating> createState() => _RatingState();
}

class _RatingState extends State<Rating> {

  bottomsheetcontroller controller = bottomsheetcontroller();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        
        leading: GestureDetector(
          onTap:() => Navigator.of(context).pop(),
          child:
      const Icon(Icons.arrow_back_ios,color: Colors.white,)),),
       floatingActionButton:  Container(
        width: 200,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Theme.of(context).colorScheme.error,
        ),
         child: FloatingActionButton(
          focusElevation: 0,
          highlightElevation: 0,
          hoverElevation: 0,
          backgroundColor:Theme.of(context).colorScheme.error ,
          elevation: 0,
                  onPressed:_bottomsheet ,
                  child: Row(
                    mainAxisAlignment:MainAxisAlignment.center ,
                    children: [
                      const Icon(Icons.edit,color: Colors.white,),
                    const SizedBox(width: 10,),
                      Text("Write a review",style: Theme.of(context).textTheme.bodyLarge,)
                    ],
                  ) ,
                  ),
       ),

      body: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20,),
            Text("Rating&Reviews",style: Theme.of(context).textTheme.bodyMedium,),
             const SizedBox(height: 30,),
             Text("4.3",style: Theme.of(context).textTheme.bodyMedium,),
      
               const SizedBox(height: 20,),
                Text("23 ratings",style: Theme.of(context).textTheme.bodyLarge,),

                const SizedBox(height: 50,),
             SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Text("8 reviews",style: Theme.of(context).textTheme.bodyMedium,),
                
                ],
              ),
              
              
              ),
              

             
      
          ],
        ),
      ),
    
    );
  }
  void _bottomsheet(){
    showModalBottomSheet(
      
      backgroundColor: Theme.of(context).colorScheme.primary,
      shape:  const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(right:Radius.circular(20),left:Radius.circular(20))
      ),
      
      context: context,
      isScrollControlled: true,
       builder: (context){
        return Container(
          height: MediaQuery.of(context).size.height * 0.75,
          child: RatingSheet(controller:controller));
       });
  }
}