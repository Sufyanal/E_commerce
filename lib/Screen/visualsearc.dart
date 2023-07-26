import 'dart:convert';
import 'dart:io';

import 'package:cross_file/src/types/interface.dart';
import 'package:ecommerce/Modals/Image_modals.dart';
import 'package:ecommerce/Modals/Rigister_modals.dart';
import 'package:ecommerce/Screen/HomePage.dart';
import 'package:flutter/material.dart';



class Splash extends StatefulWidget {
   Splash( {super.key, required String image,  });

    
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
   
    File? image;
  @override
  Widget build(BuildContext context) {
    void Nextpage(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomePage()));
    }
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body:Center(
        child: Column(
          children: [
               
              Image.file(
      
                image as File, 
                height: 100,
                width: 100,
               )
             
         
                  //  CircleAvatar(
                  // radius: 40,
                  //    child: Image.file(
                  //    image.path,
                  //    height: 100,
                  //     width: 30,
                  //    ),
                  //  ),
            
               
                  
                
                   
                
          ],
        ),
      ),
    );
  }
}