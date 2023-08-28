


import 'package:ecommerce/Screen/sHops/ProductCard.dart';
import 'package:ecommerce/main.dart';
import 'package:ecommerce/widget/favorait1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;
import '../../controller/bottomsheetcontroller.dart';
import '../../model.dart/Category.dart';
import '../../model.dart/Product_modals.dart';
import '../../widget/BottomSheet/BottomSheet_Shortby.dart';


class CategoryDetailsScreen extends StatefulWidget {
  
   final CategoryElement categoryElement;
 
  
  const CategoryDetailsScreen(String? id, {super.key, required this.categoryElement, });

  @override
  State<CategoryDetailsScreen> createState() => _CategoryDetailsScreenState();
}

class _CategoryDetailsScreenState extends State<CategoryDetailsScreen> {

   bottomsheetcontroller controller = bottomsheetcontroller();

    CategoryElement? categorymodel;
   ProductModal? productModal;

  Future<void> getProduct({ String id  = "" })async{
    http.Response response = await http.get(Uri.parse(
      "https://ecommerce.salmanbediya.com/products/get/category/${categorymodel!.id}"
    ));
    setState(() {
      productModal = productModalFromJson(response.body) ;
    });
  }
  @override
  void initState() {
    categorymodel = widget.categoryElement;
    getProduct();
    super.initState();
  }


  void togglefavorite(Product product) {
  setState(() {
     product.isfavorited = !product.isfavorited;
     if (product.isfavorited) {
        favorite.add(product);
      } else {
        favorite.remove(product);
      }
  });
}

  String selectitem = "Sort by";

  @override
  Widget build(BuildContext context) {
   return  SafeArea(
     child: Scaffold(
       appBar: AppBar(
          elevation: 0,
           leading: IconButton(
            onPressed:() => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios,color: Colors.white,)),
           
            actions: const [
               Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.search,color: Colors.white,),
            ),
            ],
        ),
    backgroundColor: Theme.of(context).colorScheme.primary,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
         Text("${widget.categoryElement.name}"),
         const SizedBox(height: 30,),
         SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _tagSalection("T-shirts"),
              const SizedBox(width: 10,),
                _tagSalection("Crop tops"),
              const SizedBox(width: 10,),
                _tagSalection("Sleeveless"),
              const SizedBox(width: 10,),
                _tagSalection("Shirts"),
              const SizedBox(width: 10,),
            ],
          ),
        

         ),
         const SizedBox(height: 20,),
         GestureDetector(
         onTap: _bottomshortby,
           child: Padding(
             padding: const EdgeInsets.only(right: 15),
             child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Icon(Icons.swap_vert,color: Colors.white,),
                Text(selectitem,style: Theme.of(context).textTheme.bodyLarge,)
              ],
             ),
           ),
         ),
         const SizedBox(height: 40,),
       productModal==null ? const Center(child: CircularProgressIndicator(color: Colors.white,) ,):
      
         SizedBox(
          height: 530,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: productModal!.products!.length,
            itemBuilder: (context,index){
              final product = productModal!.products![index];
              return _productCardCategories(product);
            },
           
          ),
        )
         
         
          ],
        ),
      )
     ),
   );
  }

  Container _tagSalection(name){
    return Container(
      height: 30,
      width: 100,
      decoration:BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.white,
      ) ,
      child: Center(child: Text(name,style:const TextStyle(color:  Color(0xff2A2C36),fontSize: 14),)),
    );
  }

  Widget _productCardCategories(Product product){
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductCard(product: product)));
      },
      child: Padding(
        padding:    const EdgeInsets.fromLTRB(10, 10, 5, 10),
        child: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
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
                      padding: const EdgeInsets.only(left: 110,top: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "${product.name}",
                             
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(color: Colors.white, fontSize: 10),
                            ),
                            const SizedBox(height: 5,),
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
                                RatingBar(
                     initialRating: double.parse(product.rating!),
                    ignoreGestures: true,
                    itemSize: 15,
                    ratingWidget: RatingWidget(
                      full: const Icon(Icons.star,color: Color(0xffFFBA49),),
                       half: const Icon(Icons.star,color: Color(0xffFFBA49),),
                        empty: const Icon(Icons.star,color: Colors.grey,),) ,
                     onRatingUpdate:((value) {
                       
                     })),
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
                     Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                     
                       children: [
                         Container(
                                    margin: const EdgeInsets.only(top: 90, right: 5),
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(200),
                                      color: Theme.of(context).colorScheme.secondary,
                                    ),
                                    child: FavoriteIconButton(
                                      favoriteproduct: product,
                                       isFavorite: favorite.any((element) => element.id == product.id)
                                       
                                       ),)
                       ],
                     ),
                        ],
                      ),
          )),
      ),
    );
          
        
      
    
  }

  void _bottomshortby()async{
    final select = await showModalBottomSheet<String>(
      context: context,
      backgroundColor: Theme.of(context).colorScheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
       builder:(BuildContext context) {
       return Shortby(controller: controller,); 
       
       });
       if(select != null){
        setState(() {
          selectitem = select;
        });
       }
  }
}
