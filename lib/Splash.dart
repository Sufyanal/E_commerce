import 'package:ecommerce/Screen/Register/signupScreen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Splash1 extends StatefulWidget {
  const Splash1({super.key});

  @override
  State<Splash1> createState() => _Splash1State();
}

class _Splash1State extends State<Splash1> {
  void nextpage(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignupScreen()));
  }
  @override
   
   void initState() {
    Future.delayed(const Duration(seconds: 5),nextpage);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        
          children: [
           SizedBox(
            height: 500,
            width: 300,
            child: Lottie.asset("Animation/splash.json",
            height: 500,
            width: 300)),
            const SizedBox(
              height: 20,
            ),
            const Text("E-Commerce",
            style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w700),
            )
          ],
        ),
      ),
    );
  }
}