import 'package:ecommerce/Modals/Detail_modals.dart';
import 'package:ecommerce/Screen/Home_Screen.dart';
import 'package:ecommerce/Screen/Profilescreens.dart/Profile.dart';
import 'package:flutter/material.dart';

import 'OrderDetail.dart';

class orders extends StatefulWidget {
  const orders({super.key});

  @override
  State<orders> createState() => _ordersState();
}

class _ordersState extends State<orders> {
   int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Theme.of(context).colorScheme.primary,
       appBar: AppBar(
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder:(context)=>const Home()));
          },
          child: Icon(Icons.arrow_back_ios,color: Colors.white,)),
          actions: [
             Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.search,color: Colors.white,),
          ),
          ],
      ),


      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
           Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10,left: 20),
                child: Text("My Profile",style: Theme.of(context).textTheme.bodyMedium,),
              )
            ],
          ),
          SizedBox(height: 15,),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  height: 30,
                  width: 100, 
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white
                  ),
                  child: Center(child: Text("Delivered",style: TextStyle(color: Color(0xff2A2C36),fontSize: 14),)),
                ),
                 const SizedBox(width: 30,),
                 Container(
                  height: 30,
                  width: 100, 
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0xff2A2C36)
                  ),
                  child: const Center(child: Text("Processing",style: TextStyle(color: Colors.white,fontSize: 14),)),
                ),
                 const SizedBox(width: 30,),
                Container(
                  height: 30,
                  width: 100, 
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0xff2A2C36)
                  ),
                  child: const Center(child: Text("BUY",style: TextStyle(color: Colors.white,fontSize: 14),)),
                ),
                const SizedBox(width: 30,),
                 Container(
                  height: 30,
                  width: 100, 
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color(0xff2A2C36)
                  ),
                  child: Center(child: Text("Cancelled",style: TextStyle(color: Colors.white,fontSize: 14),)),
                ),
               
              ],
            ),
          ),
          SizedBox(height: 20,),
           Expanded(
             child: SingleChildScrollView
             (
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  _OrderCard(),
                  const SizedBox(height: 10,),
                  _OrderCard(),
                   const SizedBox(height: 10,),
                  _OrderCard(),
                   const SizedBox(height: 10,),
                  _OrderCard(),
                ],
              ),
              ),
           ),
           
        ],
      ),
    );
  }
  Container _OrderCard(){
    return Container(
     height: 180,
     width: 340,
  
     decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
       color: Color((0xff2A2C36),
     ),),
     child:  Column(
      children: [
        const Row(
          children: [

            Padding(
              padding: EdgeInsets.only(left: 20,top: 10),
              child: Text("Order №1947034",style: TextStyle(color: Colors.white,fontSize: 16),),
            ),
            SizedBox(width: 100,),
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text("05-12-2019",style: TextStyle(color: Colors.grey,fontSize: 14),),
            )
          ],
        ),
        const SizedBox(height: 10,),
          const Row(
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 20,),
                  child: Text("Tracking number:",style: TextStyle(color: Colors.grey,fontSize: 14),),
                ),
                SizedBox(width: 5,),
                Text("IW3475453455",style: TextStyle(color: Colors.white,fontSize: 14),),
            ],
          ),
          const Row(
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 20,),
                  child: Text("Quantity:",style: TextStyle(color: Colors.grey,fontSize: 14),),
                ),
                SizedBox(width: 5),
                Text("3",style: TextStyle(color: Colors.white,fontSize: 14),
                ),
                SizedBox(width: 100,),
                 Text("Total Amount:",style: TextStyle(color: Colors.grey,fontSize: 14),),
                SizedBox(width: 5),
                Text("112#",style: TextStyle(color: Colors.white,fontSize: 14),
                ),
            ],
            
          ),
          SizedBox(height: 20,),
           Row(
         children: [
           Container(
            margin: EdgeInsets.only(left: 20),
            height:40 ,
            width:100,
            decoration: BoxDecoration(
              
              borderRadius: BorderRadius.circular(40),
              border: Border.all(
                color: Colors.white
              ),
              color: const Color((0xff2A2C36))
            ),
            child:  InkWell(
                 onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> detail()));
                 },
              child: const Center(
                child: Text("Details",style: TextStyle(color: Colors.white,fontSize: 14),))),
           ),
           const SizedBox(width: 140,),
           const Text("Delivered",style: TextStyle(color: Color(0xff55D85A),fontSize: 14),)
         ],
       ) 
        
      ],
      
     ),
     
      
      );
  }
}