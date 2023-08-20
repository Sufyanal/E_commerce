import 'package:ecommerce/Screen/BAGS/AddShippingAdress.dart';
import 'package:ecommerce/Screen/BAGS/Success.dart';
import 'package:flutter/material.dart';
import '../../controller/bottomsheetcontroller.dart';


import '../../model.dart/Checkoutmodel.dart';
import '../../widget/BottomSheet/BottomSheet_Payment.dart';
import '../../widget/Button.dart';

// ignore: must_be_immutable
class CheckOut extends StatefulWidget {

  // final String address;
  // final String name;
  // final String city;
  // final String country;
  // final String code;
  // final String state;

   CheckOut({super.key,required this.checkout});

  Checkout checkout; 

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {



  @override
void initState() {
  super.initState();
   print("${widget.checkout.address}");
}
  Checkout? checkout;
   bottomsheetcontroller controller = bottomsheetcontroller();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
     appBar: AppBar( 
          leading: IconButton(
            onPressed:() => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios,color: Colors.white,)),
           
           title: Text("Checkout",style: Theme.of(context).textTheme.bodyLarge,),
     ),

     body: Padding(
       padding: const EdgeInsets.only(left: 10,right: 10),
       child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Shipping address",style: Theme.of(context).textTheme.bodyLarge,),
         const SizedBox(height: 10,),
         Container(
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.secondary
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20,right: 10,top: 10),
            child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text( widget.checkout.name,style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 14),),
                    const Spacer(flex: 2,),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const Address()));
                      },
                      child: Text("Change",style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 14,color: const Color(0xffEF3651)),)),
                  ],
                ),
                const SizedBox(height: 10,),
                 Row(
                   children: [
                 Text(widget.checkout.address,style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 14),),
                   Text(widget.checkout.city,style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 14),),
                     Text(widget.checkout.state,style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 14),),
                     Text(widget.checkout.code,style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 14),),
                      Text(widget.checkout.country,style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 14),),
                   ],
                 ),
                 
              ],
            ),
          ),
         ),
         const SizedBox(height: 10,),
            Row(
                  children: [
                    Text("Payment",style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 14),),
                    const Spacer(flex: 2,),
                    GestureDetector(
                      onTap: (){
                     payment();
                      },
                      child: Text("Change",style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 14,color: const Color(0xffEF3651)),)),
                  ],
                ),
               const SizedBox(height: 20,),
                Container(
                  height: 50 ,
                  width: double.infinity,
                  decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.secondary
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Row(
              children: [
                Image.asset("Assets/card.png"),
              const SizedBox(width: 10,),
                Text("**** **** **** 3947",style: Theme.of(context).textTheme.bodyLarge,),
          
              ],
            ),
          ),
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  contanerCard("Assets/card1.png"),
                  const SizedBox(width: 10,),
                  contanerCard("Assets/usps.png"),
                  const SizedBox(width: 10,),
                   contanerCard("Assets/fedex.png"),
                  ],
                ),
                const SizedBox(height: 10,),
           row("Order:","112\$"),
           row("Delivery:","15\$"),
           row('Summary:', "127\$"),

           const SizedBox(height: 10,),

           submitOrder("SUBMIT ORDER", () { 
            Navigator.push(context, MaterialPageRoute(builder: (context)=> const Success()));
           })
     
        ],
       ),
     ),

    );
  }
  void payment(){
       showModalBottomSheet(
      
      backgroundColor: Theme.of(context).colorScheme.primary,
      shape:  const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(right:Radius.circular(20),left:Radius.circular(20))
      ),
      
      context: context,
      isScrollControlled: true,
       builder: (context){
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.75,
          child: PaymentCards(controller:controller));
       });

     
     }
      Widget contanerCard(image){
        return Container(
          height: 80,
         width: 100,
         decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white
         ),
         child: Image.asset(image),
        );
      }

      Widget row (name,price){
        return Padding(
          padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
          child: Row(
            children: [
              Text(name,style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey)),
              const Spacer(flex: 2,),
              Text(price,style: Theme.of(context).textTheme.bodyLarge),
            ],
          ),
        );
      }

       Widget submitOrder(String name,VoidCallback onPressed){
    return  Button(name: name, onPressed: onPressed) ;
                  
  }
  


     }