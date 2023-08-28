import 'package:ecommerce/Screen/BAGS/bags.dart';
import 'package:ecommerce/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class Success extends StatefulWidget {
  const Success({super.key});

  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 40,),
          
             Lottie.asset("Animation/succes.json",height: 250,
              ),
              const SizedBox(height: 10,),
              Text("Success!",style: Theme.of(context).textTheme.bodyMedium,),
              const SizedBox(height: 10,),
               Text("Your order will be delivered soon.\nThank you for choosing our app!",
               style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey),),

               const SizedBox(height: 10,),

               countinueShopping("CONTINUE SHOPPING",
               (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const Bags(cart: [],)));
               }
               )



          ],
        ),
      ),
    );
  }

  Widget countinueShopping (name,onPressed){
    return Button(name: name, 
    onPressed: onPressed);
  }
}