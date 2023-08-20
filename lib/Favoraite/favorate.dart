import 'package:flutter/material.dart';



import '../main.dart';
import '../model.dart/Product_modals.dart';

class Favorate extends StatefulWidget {
  
   const Favorate({super.key, required List favorite,});

  @override
  State<Favorate> createState() => _FavorateState();
}

class _FavorateState extends State<Favorate> {
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
                child: ListView.builder(
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
    return Padding(
      padding:    const EdgeInsets.fromLTRB(0, 0, 5, 10),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
            width: 400,
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).colorScheme.secondary,
            ),
            child: Stack(
              children: [
         Container(
              width: 100,
              height: 114,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Theme.of(context).colorScheme.onBackground,
                
              ),
            child: Image.network("${product.image}"),
    
                          ),
                          
              
                Padding(
                  padding: const EdgeInsets.only(left: 110,top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Column(
                          children: [
                            Text(
                                "${product.name}",
                               
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(color: Colors.white, fontSize: 10),
                              ),
                              const SizedBox(height: 0,),
                         Text(
                          "${product.description}",
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                                    softWrap: false,                     
                          style: const TextStyle(color: Colors.white, fontSize: 10),
                        ),
                        const SizedBox(height: 5,),
                         Row(
                      
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                             const Icon(Icons.star,color: Colors.yellow,size: 15,),
                           const Icon(Icons.star,color: Colors.yellow,size: 15,),
                            const Icon(Icons.star,color: Colors.yellow,size: 15,),
                             const Icon(Icons.star,color: Colors.yellow,size: 15,),
                           Text(
                              "${product.rating}",
                              style: const TextStyle(color: Colors.white, fontSize: 10),
                            ),
                         ],
                       ),
                        const SizedBox(height: 5,),
                        Text(
                          "${product.price}",
                          style: const TextStyle(color: Colors.white, fontSize: 10),
                        ),
                             
                            
                          ],
                        ),
                      ),
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
                ),
                
                    ],
                  ),
      ),
    );
          
        
      
    
  }}