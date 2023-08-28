

import 'package:ecommerce/Screen/HOMe/mAin2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';

import '../../model.dart/Product_modals.dart';

import '../../widget/ProductCard/product.dart';
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
   
    setState(() {
      productModal = productModalFromJson(response.body);
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
                SizedBox(
                    height: 300,
                    child: Image.asset(
                      "Assets/22.jpg",
                    )),
                Container(
                  margin: const EdgeInsets.only(top: 120, left: 10),
                  child: Text(
                    "Fashion\nsale",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const Main2()));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 210, left: 10),
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
            const SizedBox(
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
              productModal == null ? const Center(child:  CircularProgressIndicator(color: Colors.white,),) :
              ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: productModal!.products!.length,
                  itemBuilder: (context, index) {
                    final product = productModal!.products![index];
                    return GestureDetector(
                      child: Productlist(
                        product: product,
                        isFavorite:  favorite
                                    .any((element) => element.id == product.id),
                      ),
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>ProductCard(product: product)) );
                      },
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

}
