// ignore_for_file: non_constant_identifier_names

import 'package:ecommerce/Screen/SHops/Categoryitems.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../model.dart/Category.dart';
import '../../model.dart/Product_modals.dart';


class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  int currentIndex = 0;

   Category1? categorymodel;
    ProductModal? productModal;
  @override
  void initState() {
    super.initState();
    getProduct();
     
  }
  

    


  Future<void> getProduct() async {
    http.Response response = await http.get(Uri.parse(
        "https://ecommerce.salmanbediya.com/products/category/getAll"));
    print(response.body);
    setState(() {
      categorymodel = categoryFromJson(response.body);
    });
  }
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff1E1F28),
     appBar: AppBar(
        elevation: 0,
         leading: IconButton(
            onPressed:() => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back_ios,color: Colors.white,)),
          title: Text("Categories",style: Theme.of(context).textTheme.bodyLarge,),
          actions: const [
             Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.search,color: Colors.white,),
          ),
          ],
      ),
     body: Center(
       child: Column(
        children: [
          
          Container(
            margin: EdgeInsets.only(top: 30),
                  decoration:   BoxDecoration(
                     borderRadius: const BorderRadius.all(Radius.circular(30)),
                     color: Theme.of(context).colorScheme.error
     
                  ),
                  height: 50,
                  width: 350,
                 child: Center(
                   child: Text("VIEW ALL ITEMS",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white)
                    ),
                 ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15,),
                      Text("Choose category",style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white),),
                           const SizedBox(height: 20,),
                            Container(
              height: 350,
              padding: const EdgeInsets.only(right: 10),
              child: 
              categorymodel == null ? const Center(child:  CircularProgressIndicator(color: Colors.white,),) :
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: categorymodel!.categories!.length,
                  itemBuilder: (context, index) {
                    final category  = categorymodel!.categories![index];
                    return _listTile(category);
                  }),
            ),
                         
                    ],
                  ),
                )
        
        ],
       ),
     ),

    );
  }

  Widget _listTile (CategoryElement categoryElement){
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryDetailsScreen( 
          categoryElement.id, categoryElement: categoryElement,
          
          )));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${categoryElement.name}",
          style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
           
          ),
          const SizedBox(height: 20,),
           const Divider(height: 1,color: Colors.grey),
            const SizedBox(height: 20,),
            
        ],
      ),
    );
  }


}