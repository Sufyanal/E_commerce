import 'dart:async';




import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../main.dart';

import '../../model.dart/Product_modals.dart';

import '../../widget/productCard/product.dart';
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
    http.Response response = await http.get(Uri.parse("https://ecommerce.salmanbediya.com/products/tag/sale/getAll"));
     http.Response salesresponse = await http.get(Uri.parse("https://ecommerce.salmanbediya.com/products/tag/new/getAll"));
    setState(() {
      salesitem = productModalFromJson(response.body);
      newitems = productModalFromJson(salesresponse.body);
    });
    
   }
  @override
  void initState(){
    super.initState();
    getProduct();
    _timer = Timer.periodic(const Duration(seconds: 2),
     (Timer timer) {
     if (_currentPage <4 ) {
      _currentPage++;
     }else{
      _currentPage = 0;
     }
      _pageController.animateToPage(
      _currentPage,
       duration: const Duration(milliseconds: 300),
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
          SizedBox(
            height: 280,
           
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
           const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Text(
                      "Sale",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const Spacer(),
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
                  const SizedBox(
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
                padding: const EdgeInsets.only(right: 10),
                child: 
                salesitem == null ? const Center(child:  CircularProgressIndicator(color: Colors.white,),) :
                ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: salesitem!.products!.length,
                    itemBuilder: (context, index) {
                      final product = salesitem!.products![index];
                      return GestureDetector(
                        child: Productlist(
                          product: product,
                         isFavorite: favorite.any((element) => element.id == product.id) 
                         ),
                         onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductCard(product: product)));
                         },
                      );
                    }),
              ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Text(
                    "New",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const Spacer(),
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
                const SizedBox(
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
                padding: const EdgeInsets.only(right: 10),
                child: 
                newitems == null ? const Center(child:  CircularProgressIndicator(color: Colors.white,),) :
                ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: newitems!.products!.length,
                    itemBuilder: (context, index) {
                      final product = newitems!.products![index];
                      return GestureDetector(
                        child: Productlist(
                          product: product,
                         isFavorite: favorite.any((element) => element.id == product.id) 
                         ),
                         onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductCard(product: product)));
                         },
                      );
                    }),
              ),
        ],
      ),
    )

    );
  }

  Widget _container (image){
    return SizedBox(
    height: 100,
      width: 200,
      child: Image.network(image,width:500,),
    );
  }


  
}