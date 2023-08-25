
// ignore_for_file: non_constant_identifier_names



import 'package:ecommerce/Favoraite/favorate.dart';

import 'package:ecommerce/widget/BottomSheet/BottomSheet_Size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;
import '../../controller/bottomsheetcontroller.dart';

import '../../main.dart';
import '../../model.dart/Category.dart';
import '../../model.dart/Product_modals.dart';
import '../../model.dart/Review.dart';
import '../../widget/BottomSheet/BottomSheet_Color.dart';
import '../../widget/Button.dart';
import 'Rating&Reviews.dart';


class ProductCard extends StatefulWidget {
  
  final Product product;
   

  const ProductCard({super.key,required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
    CategoryElement? categoryElement;
     ProductModal? productModal;
     Reviews? reviews;

  Future<void> getProduct()async{
    http.Response response = await http.get(Uri.parse(
      "https://ecommerce.salmanbediya.com/products/getAll"
    ));
    setState(() {
      productModal = productModalFromJson(response.body);
    });
  }
  @override
  void initState() {
    getProduct();
    super.initState();
  }

  bottomsheetcontroller controller = bottomsheetcontroller();
  String selectedvalue = "Size";
   String selectedvalue1 = "color";

   void togglefavorite(){
    setState(() {
      widget.product.isfavorited = !widget.product.isfavorited;
       if ( widget.product.isfavorited) {
        favorite.add(widget.product);
      } else {
      favorite.remove( widget.product); 
      }
    });
   }
   void toggleAddtoCart(){
  setState(() {
   widget.product.addcart = !widget.product.addcart;
    if (widget.product.addcart) {
      cart.add(widget.product);
    }else{
      cart.remove(widget. product);
    }
  });

}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
         appBar: AppBar(
          
          leading: IconButton(
            onPressed:() => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios,color: Colors.white,)),
           
           title: Text("${widget.product.name}",style: Theme.of(context).textTheme.bodyLarge,),
            actions: const [
               Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.share,color: Colors.white,),
            ),
            ],
        ),

        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network("${widget.product.image}"),
             const SizedBox(height: 15,),
            
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                     onTap: _BottomSizeSheet,
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      height: 40,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(5),
                        border: Border.all(
                          color: const Color(0xffFF2424)
                        )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(selectedvalue,style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 14),),
                          const SizedBox(width: 30,),
                          const Icon(Icons.expand_more_outlined, color: Colors.white,),
                        ],
                      ),
                              
                      
                    ),
                  ),
                   
                  GestureDetector(
                    onTap: _BottomColorSheet,
                    child: Container(
                       margin: const EdgeInsets.all(10),
                      height: 40,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(5),
                        border: Border.all(
                          color: Colors.white,
                        )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(selectedvalue1,style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 14),),
                          const SizedBox(width: 30,),
                          const Icon(Icons.expand_more_outlined, color: Colors.white,),
                        ],
                      ),),
                  ),
                   Container(                
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(200),
                                        color: Theme.of(context).colorScheme.secondary,
                                      ),
                                      child:  IconButton(
                                        
                                         icon: Icon(
                                          widget.product.isfavorited?
                                          Icons.favorite:
                                          Icons.favorite_border,
                                          color :   widget.product.isfavorited?Colors.red : Colors.white,
                                         ),
                                         onPressed: togglefavorite,
                                         )
                                    ),
                ],
              ),
            ),
            
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("H&M",style: Theme.of(context).textTheme.bodyMedium,),
                      const Spacer(),
                     Text("${widget.product.price}",
                      style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),),
                    ],
                  ),
                   const SizedBox(height: 5,),
                   Text("${widget.product.name}",
                      style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 11,
                  ),),
                  const SizedBox(height: 5,),
                  Row(
                    children: [
                        RatingBar(
                    // initialRating: double.parse(reviews!.rating!),
                    ignoreGestures: true,
                    itemSize: 30,
                    ratingWidget: RatingWidget(
                      full: const Icon(Icons.star,color: Color(0xffFFBA49),),
                       half: const Icon(Icons.star,color: Color(0xffFFBA49),),
                        empty: const Icon(Icons.star,color: Colors.grey,),) ,
                     onRatingUpdate:((value) {
                       
                     })),
                           GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> RatingsAndReviewsScreen( product: widget. product ,) ) );
                            },
                             child: Text(
                              "${widget.product.rating}",
                              style: const TextStyle(color: Color(0xffF5F5F5), fontSize: 14),
                                                     ),
                           ),
                    ],
                  ),
                 
                     const SizedBox(height: 5,),
                     Text(
                            "${widget.product.description}",
                            style: const TextStyle(color: Color(0xffF5F5F5), fontSize: 14),
                          ),
                           const SizedBox(height: 5,),
                      AddCartbutton("ADD TO CART",()=>toggleAddtoCart(),
                        
                      
                         
                      ),
                   
            
             const SizedBox(height: 10,),
           const Divider(height: 1 ,color: Colors.white,),
             _Sizeinfo("Shipping info"),
             const SizedBox(height: 10,),
                 const Divider(height: 1 ,color: Colors.white,),
                 _Sizeinfo("Support"),
               const SizedBox(height: 10,),
                  const Divider(height: 1 ,color: Colors.white,),
                    const SizedBox(height: 10,),
                   const Row(
                     children: [
                       Text(
                                "You can also like this",
                                style: TextStyle(color: Color(0xffF5F5F5), fontSize: 18),
                              ),
                               Spacer(),
                                Text(
                                "12 items",
                                style: TextStyle(color: Colors.grey, fontSize: 11),
                              ),
                                 SizedBox(height: 10,),
                     ],
                   ),
                 

                ],
                
              ),
            ),
              Container(
                height: 350,
                padding: EdgeInsets.only(right: 10),
                child: 
               productModal == null ? const Center(child:  CircularProgressIndicator(color: Colors.white,),) :
                ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: productModal!.products!.length,
                    itemBuilder: (context, index) {
                      final product = productModal!.products![index];
                      return _product1_card(product);
                    }),
              ),

            ],
          ),
        ),
      ));
  }

  Widget _product1_card(Product product) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 5, 10),
      child: Column(
        children: [
          Container(
              color: Theme.of(context).colorScheme.primary,
              margin: EdgeInsets.all(8.0),
              height: 300,
              width: 120,
              child: Center(
                child: Column(
                  children: [
                    Stack(children: [
                      Container(
                        height: 150,
                        width: 130,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white),
                        child: Image.network("${product.image}"),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 120, right: 5),
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(200),
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            child: IconButton(onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Favorate(favorite: favorite)));
                            },
                                 icon: Icon(
                                  product.isfavorited?
                                  Icons.favorite:
                                  Icons.favorite_border,
                                  color: product.isfavorited ? Colors.red : Colors.white,
                            
                                ))
                          ),
                        ],
                      ),
                      
                    ]),
                     Row(
                       children: [
                        Icon(Icons.star,color: Colors.yellow,size: 15,),
                         Icon(Icons.star,color: Colors.yellow,size: 15,),
                          Icon(Icons.star,color: Colors.yellow,size: 15,),
                           Icon(Icons.star,color: Colors.yellow,size: 15,),
                         Text(
                            "${product.rating}",
                            style: const TextStyle(color: Colors.white, fontSize: 10),
                          ),
                       ],
                     ),
                    Text(
                      
                        "${product.name}",
                        style: const TextStyle(color: Colors.white, fontSize: 10),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "${product.price}",
                        style: const TextStyle(color: Colors.white, fontSize: 10),
                      )
                  ],
                ),
              )),
        ],
      ),
    );
  }

  void _BottomSizeSheet()async{
    final select = await showModalBottomSheet<String>(
      
      backgroundColor: Theme.of(context).colorScheme.primary,
      shape:  const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(right:Radius.circular(20),left:Radius.circular(20))
      ),
      context: context,
       builder: (BuildContext context){
       return SizeBottomsheet(controller: controller);
       });
       if(select != null){
       setState(() {
         selectedvalue = select;
       });
  }
 
  
  }
 void _BottomColorSheet()async{
    final selected = await showModalBottomSheet<String>(
      
      backgroundColor: Theme.of(context).colorScheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      context: context,
       builder: (BuildContext context){
       return colornamesheet(controller: controller);
       });
       if(selected != null){
       setState(() {
         selectedvalue1 = selected;
       });
  }
  }  

   Widget AddCartbutton(String name,VoidCallback onPressed,){
    return  Button(name: name, onPressed: onPressed);
    }
    
     ListTile _Sizeinfo(name){
    return ListTile(
     title: Text(name,style:Theme.of(context).textTheme.bodyLarge), 
     trailing: const Icon(Icons.arrow_forward_ios_outlined,color: Colors.white,),
    );
  }
  
                  
  }

  