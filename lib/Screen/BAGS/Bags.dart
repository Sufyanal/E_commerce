
import 'package:ecommerce/Screen/BAGS/AddShippingAdress.dart';
import 'package:ecommerce/Screen/BAGS/CheckOut.dart';
import 'package:ecommerce/main.dart';
import 'package:ecommerce/widget/Button.dart';
import 'package:flutter/material.dart';
 import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import '../../model.dart/Checkoutmodel.dart';
import '../../model.dart/Product_modals.dart';





class Bags extends StatefulWidget {
  const Bags({super.key,required List  cart});

  @override
  State<Bags> createState() => _BagsState();
}

class _BagsState extends State<Bags> {

  
  
  int quantity = 1;
  int price = 0;
   double totalamount = 0.0;
  
  
 

 

  
   int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        appBar: AppBar(
        elevation: 0,
          actions: const [
             Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.search,color: Colors.white,),
          ),
          ],
      ),

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          
          Text("My Bag",style: Theme.of(context).textTheme.bodyMedium,),
      
          const SizedBox(height: 5,),
           // ignore: sized_box_for_whitespace
           Container(
            height: 300,
             child:
             
             cart.isEmpty  ?Center(child: Lottie.asset("Animation/empty.json"),):
                   ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: cart.length ,
             itemBuilder: (context, index) {
               final product = cart[index];
               return ProductCard( product,);
             },
                   ),
           ),
           const SizedBox(height: 10,),
            TextField(
              style: const TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    fillColor: Theme.of(context).colorScheme.secondary,
                                    filled: true,
                                    hintText:"Enter your promo code" ,
                                    hintStyle: const TextStyle(color: Colors.white),
                                    border: const OutlineInputBorder(
                                     borderRadius: BorderRadius.all(Radius.circular(20))
                                    ),
                                   
                                  ),
                                  
                                ),
      
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                 Text("Total amount:",style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey,fontSize: 14),),
                 const Spacer(),
                 Text(totalamount.toStringAsPrecision(2),style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 18),),
                ],
              ),
            ),
            const SizedBox(height: 20,),

            checkOutbutton("Check Out", (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>  CheckOut(checkout: Checkout(name: '', city: '', 
              address: '', code:'', country: '', state:'') ,
              )));
            })
        
          ]),
        ),
      ),

    );
    
  }

  Widget ProductCard (Product product){
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
                child: Image.network("${ product.image}"),
      
                              ),
                              
                  
                    Padding(
                      padding: const EdgeInsets.only(left: 110,top: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "${ product.name}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(color: Colors.white, fontSize: 10),
                            ),
                            
                           Row(
                             children: [
                               Text("Color:",style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey,fontSize: 11),),
                                Text("black",style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 11),),
                                const SizedBox(width: 10,),
                                 Text("Size:",style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey,fontSize: 11),),
                                Text("M",style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 11),),
                             
Spacer(),
                            const  Icon(Icons.more_vert,color: Colors.white,),                  
                             
                             
                             ],
                           ),

                              Row(
                                children:  [
                                  SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: FloatingActionButton(onPressed:(){
                                      setState(() {
                                        if (quantity >0) {
                                          quantity--;
                                           if (quantity == 0) {
                                        product.addcart = false;
                             cart.remove(product);
}
                                     
                                        }
                                      });
                                    },
                                     child: const Text("-",style: TextStyle(color: Colors.white,fontSize: 10),),
                                    ),
                                  ),
                                  const SizedBox(width: 10,),
                                   Text("$quantity",
                                  style: const TextStyle(color: Colors.white,fontSize: 15),),
                                  const SizedBox(width: 10,),
                                  SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: FloatingActionButton(onPressed:(){
                                      setState(() {
                                          quantity++;
                                          product.price! * quantity;
                                          
                                      });
                                    },
                                     child: const Text("+",style: TextStyle(color: Colors.white,fontSize: 10),),
                                    ),
                                  ),
                                  const Spacer(),
                                   Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: Text(     (double.parse(product.price!) * quantity).toStringAsFixed(2) ,style: const TextStyle(color: Colors.white,fontSize: 10)),
                                   ),
                                ],
                              ),
                               
                        ],
                      ),
                    ),
                        ],
                      ),
          )),
      );
  }
   Widget checkOutbutton(String name,VoidCallback onPressed){
    return   Button(name: name, onPressed: onPressed);
  }
}