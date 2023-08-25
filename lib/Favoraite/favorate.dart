import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lottie/lottie.dart';



import '../main.dart';
import '../model.dart/Product_modals.dart';

class Favorate extends StatefulWidget {
  
   const Favorate({super.key, required List favorite,});

  @override
  State<Favorate> createState() => _FavorateState();
}

class _FavorateState extends State<Favorate> {

void toggleAddtoCart(Product product){
  setState(() {
    product.addcart = !product.addcart;
    if (product.addcart) {
      cart.add(product);
    }else{
      cart.remove(product);
    }
  });

}

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
         appBar: AppBar(
       actions:const [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.search,color: Colors.white,),
        ),
       ] 
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Favorites",style: Theme.of(context).textTheme.bodyMedium,),
              const SizedBox(height: 20,),
              SizedBox(
                height: 530,
                 
                child:
                favorite.isEmpty  ?Center(child: Lottie.asset("Animation/favorait.json"),):
                 ListView.builder(
                  itemCount: favorite.length,
                  itemBuilder: (context, index) {
                    final product = favorite[index];
                    return  _ProductCard_Categories(product);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget _ProductCard_Categories(Product product){
    return  Padding(
        padding:    const EdgeInsets.fromLTRB(10, 10, 5, 10),
        child: Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
                width: 350,
                height: 104,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.secondary,
                ),
                child: Stack(
                  children: [
             Container(
                  width: 100,
                  height: 104,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Theme.of(context).colorScheme.onBackground,
                    
                  ),
                child: Image.network("${product.image}"),
      
                              ),
                              
                  
                    Padding(
                      padding: const EdgeInsets.only(left: 110,top: 10,right: 35),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "${product.name}",
                             
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          
                           
                             
                            const SizedBox(height: 10,),
                            Text(
                              "${product.dateModified}",
                              style: const TextStyle(color: Colors.white, fontSize: 10),
                            ),
                            Row(
                             children: [
                               Text("Color:",style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey,fontSize: 11),),
                                Text("black",style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 11),),
                                const SizedBox(width: 10,),
                                 Text("Size:",style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey,fontSize: 11),),
                                Text("M",style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 11),),
              
                             
                             
                             ],
                           ),
                             const SizedBox(height: 10,),
                           Row(
                             children: [
                               
                                Text( "${product.price}",style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 11),),
                                const SizedBox(width: 40,),
                                RatingBar(
                    // initialRating: double.parse(reviews!.rating!),
                    ignoreGestures: true,
                    itemSize: 10,
                    ratingWidget: RatingWidget(
                      full: const Icon(Icons.star,color: Color(0xffFFBA49),),
                       half: const Icon(Icons.star,color: Color(0xffFFBA49),),
                        empty: const Icon(Icons.star,color: Colors.grey,),) ,
                     onRatingUpdate:((value) {
                       
                     })),
                                Text("${product.rating}",style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 11),),
              
                             
                             
                             ],
                           ),
                               
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                          IconButton(
                              
                                                icon: const Icon(Icons.close),
                                                onPressed: () {
                                                  setState(() {
                                                    product.isfavorited = false;
                                                   favorite.remove(product);
                                                  });
                                                 
                                                },
                                              ),
                      ],
                    ),
                  
                     Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                     
                       children: [
                         Container(
                                    margin: const EdgeInsets.only(top: 80, right: 5),
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(200),
                                      color: Theme.of(context).colorScheme.secondary,
                                    ),
                                    child: IconButton(
                                  
                                  
                   icon:  Icon(
                      
                      
                                            Icons.shopping_bag,
                                          
                                            color : Colors.white),
                                            onPressed: ()=>
                                    toggleAddtoCart(product),
),

                                   
                                  ),
                       ],
                     ),
                        ],
                      ),
          )),
      );
          
        
      
    
  }}
  