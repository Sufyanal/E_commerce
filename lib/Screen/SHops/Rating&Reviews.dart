
  

import 'dart:convert';
import 'package:ecommerce/Screen/SHops/ReviewCard.dart';


import 'package:ecommerce/widget/BottomSheet/BottomSheet_Rating.dart';
import 'package:flutter/material.dart';
import '../../controller/bottomsheetcontroller.dart';
import '../../model.dart/Product_modals.dart';

import 'package:http/http.dart' as http;
import '../../model.dart/Review.dart';


class RatingsAndReviewsScreen extends StatefulWidget {
  const RatingsAndReviewsScreen({super.key, required this.product});

  final Product product;

  @override
  State<RatingsAndReviewsScreen> createState() =>
      _RatingsAndReviewsScreenState();
}

class _RatingsAndReviewsScreenState extends State<RatingsAndReviewsScreen> {
  RatingsReviews? reviews;
  bottomsheetcontroller controller = bottomsheetcontroller();

  Future<void> getProductsRatingsReviews() async {
    http.Response response = await http.get(Uri.parse(
        'https://ecommerce.salmanbediya.com/products/review/get/${widget.product.id}'));

    setState(() {
      reviews = RatingsReviews.fromJson(jsonDecode(response.body));
    });
  }

  @override
  void initState() {
    getProductsRatingsReviews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                        Text("Write a review",style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 20),)
                      ],
                    ) ,
                    ),
         ),
          
        
       
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Rating&Reviews',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 22, bottom: 30),
              child: Column(
                children: [
                  Text(
                    '${widget.product.rating}',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 40),
                  ),
                  Text(
                    widget.product.reviews == 1
                        ? '${widget.product.reviews} rating'
                        : '${widget.product.reviews} ratings',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
            Expanded(
              child: reviews == null
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: Color(0xffEF3651),
                    ))
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          reviews!.reviews!.length == 1
                              ? '${reviews!.reviews!.length} review'
                              : '${reviews!.reviews!.length} reviews',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(
                          height: 13,
                        ),
                        Expanded(
                            child: reviews!.reviews!.isEmpty
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 45),
                                    child: Center(
                                      child: Text(
                                        'There are not any reviews available on this product.',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  )
                                : ListView.builder(
                                    itemCount: reviews!.reviews!.length,
                                    itemBuilder: (context, index) {
                                      final reviewsList =
                                          reviews!.reviews![index];
                                      return ReviewCard(reviews: reviewsList);
                                    },
                                  )),
                      ],
                    ),
            )
          ]),
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

 

