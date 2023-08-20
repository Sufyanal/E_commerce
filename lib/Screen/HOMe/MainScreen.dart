

import 'package:ecommerce/Screen/HOMe/MAin2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';

import '../../model.dart/Product_modals.dart';
import '../SHops/ProductCard.dart';


class Main extends StatefulWidget {
  const Main({
    super.key,
  });

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
   ProductModal? productModal;
  @override
  void initState() {
    super.initState();
    getProduct();
  }

  Future<void> getProduct() async {
    http.Response response = await http.get(Uri.parse(
        "https://ecommerce.salmanbediya.com/products/tag/new/getAll"));
    print(response.body);
    setState(() {
      productModal = productModalFromJson(response.body);
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Stack(
             
              children: [
                Container(
                    height: 300,
                    child: Image.asset(
                      "Assets/22.jpg",
                    )),
                Container(
                  margin: EdgeInsets.only(top: 120, left: 10),
                  child: Text(
                    "Fashion\nsale",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Main2()));
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 210, left: 10),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(20)),
                        color: Theme.of(context).colorScheme.error),
                    height: 50,
                    width: 150,
                    child: Center(
                      child: Text("Check",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: Colors.white)),
                    ),
                  ),
                ),
              ],
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
              productModal == null ? const Center(child:  CircularProgressIndicator(color: Colors.white,),) :
              ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: productModal!.products!.length,
                  itemBuilder: (context, index) {
                    final product = productModal!.products![index];
                    return _product_card(product);
                  }),
            ),
          ],
        ),
      ),
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
                      Stack(
                        children: [
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
                             
                              child: IconButton(
                                          
                                           icon: Icon(
                                            
                                            product.isfavorited? 
                                            Icons.favorite:
                                            Icons.favorite_border,
                                            color :   product.isfavorited?Colors.red : Colors.white,
                                           ),
                                           onPressed:()=> togglefavorite(product),
                                           )
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
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(color: Colors.white, fontSize: 10),
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
