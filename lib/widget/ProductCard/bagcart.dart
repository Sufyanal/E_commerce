import 'package:ecommerce/main.dart';
import 'package:ecommerce/model.dart/Product_modals.dart';
import 'package:flutter/material.dart';



class BagsCart extends StatefulWidget {

  Product product;
  Function?state;


  BagsCart({super.key,required this.product,required this.state});

  @override
  State<BagsCart> createState() => _BagsCartState();
}

class _BagsCartState extends State<BagsCart> {
  int quantity = 1;
  double totalAmount = 0;
  @override
  Widget build(BuildContext context) {
     double productprice = double.parse(widget.product.price!);
    return  Padding(
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
                child: Image.network("${widget. product.image}"),
      
                              ),
                              
                  
                    Padding(
                      padding: const EdgeInsets.only(left: 110,top: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "${widget. product.name}",
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
                             
const Spacer(),
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
                                          if (totalAmount != 0 ) {
                                            totalAmount =totalAmount-  double.parse(
                                              widget.product.price!);
                                              widget.state!();
                                          }
                                           if (quantity == 0) {
                                       widget. product.addcart = false;
                             cart.remove(widget.product);
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
                                          totalAmount = double.parse(widget.product.price!)+ totalAmount;
                                          widget.product.price! * quantity;
                                          
                                      });
                                    },
                                     child: const Text("+",style: TextStyle(color: Colors.white,fontSize: 10),),
                                    ),
                                  ),
                                  const Spacer(),
                                   Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: Text(     (double.parse(widget.product.price!) * quantity).toStringAsFixed(2) ,style: const TextStyle(color: Colors.white,fontSize: 10)),
                                   ),
                                ],
                              ),
                              

                               
                        ],
                      ),
                    ),
                        ],
                      ),
          
          ),
          
          )
          ,
      ); 
      
  }
}