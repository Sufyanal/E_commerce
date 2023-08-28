import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../main.dart';
import '../../model.dart/Product_modals.dart';
import '../Favorait1.dart';


class Productlist extends StatefulWidget {
  Product product;
  bool isFavorite;
   Function? state;

   Productlist({super.key ,
   required this.product,
   required this.isFavorite
   });

  @override
  State<Productlist> createState() => _ProductlistState();
}

class _ProductlistState extends State<Productlist> {
  
  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 5, 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                color: Theme.of(context).colorScheme.primary,
                margin: const EdgeInsets.all(8.0),
                height: 300,
                width: 120,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                        GestureDetector(
                          child: Container(
                            height: 150,
                            width: 130,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white),
                            child: Image.network("${widget.product.image}"),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 130,right: 10),
                            child: FavoriteIconButton(
                                                
                                                  isFavorite: favorite.any(
                              (element) => element.id == widget.product.id),
                                                  favoriteproduct: widget.product,
                                                  state: () {
                            if (widget.state != null) {
                              widget.state!();
                            }
                                                  },
                                                ),
                          )
                          ],
                        ),
                        
                      ]),
                       Row(
                         children: [
                        RatingBar(
                     initialRating: double.parse(widget.product.rating!),
                    ignoreGestures: true,
                    itemSize: 15,
                    ratingWidget: RatingWidget(
                      full: const Icon(Icons.star,color: Color(0xffFFBA49),),
                       half: const Icon(Icons.star,color: Color(0xffFFBA49),),
                        empty: const Icon(Icons.star,color: Colors.grey,),) ,
                     onRatingUpdate:((value) {
                       
                     })),
                           Text(
                              "${widget.product.rating}",
                              style: const TextStyle(color: Colors.white, fontSize: 10),
                            ),
                         ],
                       ),
                      Text(
                          "${widget.product.name}",
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(color: Colors.white, fontSize: 10),
                        ),
                        Text(
                          "${widget.product.price}",
                          style: const TextStyle(color: Color(0xffEF3651), fontSize: 10),
                        )
                    ],
                  ),
                )),
          ],
        ),
      );
  }
}