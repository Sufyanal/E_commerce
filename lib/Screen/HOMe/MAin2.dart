import 'dart:async';




import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';
import '../../model.dart/Product_modals.dart';
import '../SHops/ProductCard.dart';

class Main2 extends StatefulWidget {
  const Main2({super.key});

  @override
  State<Main2> createState() => _Main2State();
}

class _Main2State extends State<Main2> {
  int _currentPage = 0;
  
   late Timer _timer;
  
   final PageController _pageController = PageController(initialPage: 0);
   
    ProductModal? salesitem;
     ProductModal? newitems;
     Product? product;

   Future <void> getProduct()async{
    http.Response response = await http.get(Uri.parse("https://ecommerce.salmanbediya.com/products/getAll"));
     http.Response salesresponse = await http.get(Uri.parse("https://ecommerce.salmanbediya.com/products/tag/new/getAll"));
    setState(() {
      salesitem = productModalFromJson(response.body);
      newitems = productModalFromJson(salesresponse.body);
    });
    
   }
    void togglefavorite(Product product){
    setState(() {
     product.isfavorited  = !product.isfavorited;
     if ( product.isfavorited) {
        favorite.add( product);
      } else {
        favorite.remove( product);
      }
    });
   }
 
    

  @override
  void initState(){
    super.initState();
    getProduct();
    _timer = Timer.periodic(Duration(seconds: 2),
     (Timer timer) {
     if (_currentPage <4 ) {
      _currentPage++;
     }else{
      _currentPage = 0;
     }
      _pageController.animateToPage(
      _currentPage,
       duration: Duration(milliseconds: 300),
       curve: Curves.easeIn);
     });
    
  }
  @override
  void dispose (){ 
    super .dispose();
    _timer.cancel();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
 backgroundColor: Theme.of(context).colorScheme.primary,
    body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Container(
            height: 250,
           
            child:PageView(
             
              controller: _pageController,
              children: [
              _container("https://pagefly.io/cdn/shop/articles/Best_Shopify_T-shirt_Stores_For_Your_Inspiration_in_2021.png?v=1621964186"),
              _container("https://sp-ao.shortpixel.ai/client/q_glossy,ret_img,w_800/https://www.modalyst.co/wp-content/uploads/2020/01/john-fornander-B0p9H9km0BI-unsplash.jpg"),
              _container("https://nationaljeweler.com/uploads/2ce76797e1caf0c6e7d0dd84a8f88204.jpg"),
              _container("https://burst.shopifycdn.com/photos/anchor-bracelet-mens.jpg?width=1200&format=pjpg&exif=1&iptc=1"),               
              ],
            
            ),
          ),
           SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "Sale",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Spacer(),
                    Text("View all",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontSize: 11, color: Colors.grey)),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text("You’ve never seen it before!",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontSize: 11, color: Colors.grey)),
                ],
              ),
              Container(
                height: 350,
                padding: EdgeInsets.only(right: 10),
                child: 
                salesitem == null ? const Center(child:  CircularProgressIndicator(color: Colors.white,),) :
                ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: salesitem!.products!.length,
                    itemBuilder: (context, index) {
                      final product = salesitem!.products![index];
                      return _product_card(product);
                    }),
              ),
                 SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "New",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Spacer(),
                  Text("View all",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontSize: 11, color: Colors.grey)),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 10,
                ),
                Text("You’ve never seen it before!",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontSize: 11, color: Colors.grey)),
              ],
            ),
               Container(
                height: 350,
                padding: EdgeInsets.only(right: 10),
                child: 
                newitems == null ? const Center(child:  CircularProgressIndicator(color: Colors.white,),) :
                ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: newitems!.products!.length,
                    itemBuilder: (context, index) {
                      final product = newitems!.products![index];
                      return _product1_card(product);
                    }),
              ),
        ],
      ),
    )

    );
  }

  Container _container (image){
    return Container(
    height: 100,
      width: 200,
      child: Image.network(image,width:500,),
    );
  }

    Widget _product_card(Product product) {
    return GestureDetector(
       onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductCard(product: product)));
      },
      child: Padding(
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
                              child: IconButton(onPressed:()=> togglefavorite(product)
                                  , icon: Icon(
                                    product.isfavorited?
                                    Icons.favorite:
                                    Icons.favorite_border,
                                    color: product.isfavorited ? Colors.red : Colors.white,
                                size: 30,
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
      ),
    );
  }
 

  
    Widget _product1_card(Product product) {
    return GestureDetector(
       onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductCard(product: product)));
      },
      child: Padding(
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
                              child: IconButton(onPressed: ()=>togglefavorite(product)
                                  , icon: Icon(
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
      ),
    );
  }

  
}