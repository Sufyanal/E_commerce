
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Home_Screen.dart';



class Splash extends StatefulWidget {
  final File? image;
   const Splash( {super.key, this. image,  });

    
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
   
    File? image;
  
   // ignore: non_constant_identifier_names
   Future<void> Nextpage() async {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Home()));
    }

    @override
    void initState(){
     Future.delayed(const Duration(seconds: 5),Nextpage);
     super.initState();
    }


  @override
  Widget build(BuildContext context) {
 
    return WillPopScope(
      onWillPop: () async => false ,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body:Center(
          child: Column(
    
            children: [
                 
                Padding(
                  padding: const EdgeInsets.only(top: 150),
                  child: Image.file(
                      
                   widget.image !, 
                    height: 250,
                    width: 400,
                   ),
                ),
                const SizedBox(height: 50,),
                const Icon(Icons.search,size: 100,color: Color(0xffEF3651)),
                Padding(
                  padding: const EdgeInsets.only(left: 70),
                  child: Text("Finding similar       results...",
                  style:GoogleFonts.metrophobic(fontSize: 34, ),),
                )
               
              
                 
                    
                  
                     
                  
            ],
          ),
        ),
      ),
    );
  }
}