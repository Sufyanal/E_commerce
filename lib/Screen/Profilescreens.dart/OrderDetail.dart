import 'package:ecommerce/Screen/Profilescreens.dart/MyOrder.dart';
import 'package:flutter/material.dart';

class detail extends StatefulWidget {
  const detail({super.key});

  @override
  State<detail> createState() => _detailState();
}

class _detailState extends State<detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
       appBar: AppBar(
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder:(context)=>const orders()));
          },
          child: const Icon(Icons.arrow_back_ios,color: Colors.white,)),
          title: const Center(child: Text("Order Details",style: TextStyle(fontSize: 18,color: Colors.white),)),
          actions: const [
             Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.search,color: Colors.white,),
          ),
          ],
      ),

      body:  Center(
        child: Column(
          children: [
            const Row(
            children: [
        
              Padding(
                padding: EdgeInsets.only(left: 20,top: 20),
                child: Text("Order №1947034",style: TextStyle(color: Colors.white,fontSize: 16),),
              ),
              SizedBox(width: 130,),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text("05-12-2019",style: TextStyle(color: Colors.grey,fontSize: 14),),
              )
            ],
          ),
            const SizedBox(height: 20,),
             const Row(
              children: [
                Padding(
                    padding: EdgeInsets.only(left: 20,),
                    child: Text("Tracking number:",style: TextStyle(color: Colors.grey,fontSize: 14),),
                  ),
                  SizedBox(width: 5,),
                  Text("IW3475453455",style: TextStyle(color: Colors.white,fontSize: 14),),
                     SizedBox(width: 35,),
              Text("Delivered",style: TextStyle(color: Color(0xff55D85A),fontSize: 14),)
              ],
            ),
             const SizedBox(height: 20,),
              const Row(
              children: [
                Padding(
                    padding: EdgeInsets.only(left: 20,),
                    child: Text("3 items",style: TextStyle(color: Colors.white,fontSize: 14),),
                  ),
                
              ],
            ),
            // items list
            Column(
             children: [
               const SizedBox(height: 20,),
               _items("Assets/p.png"),
               const SizedBox(height: 20,),
                _items("Assets/p2.png"),
                const SizedBox(height: 20,),
                 _items("Assets/p4.png"),
                 
             ],
             ),
        
            // items list
            SizedBox(height: 20,),
             Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
               child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Order information",style: TextStyle(fontSize: 14),),
              // const SizedBox(height: 20,),
                  _information(),
                  
                ],
               ),
              ),
                       )
            
            
          ],
        ),
      ),
    );
  }

//  _items List

Container _items(String assets){
  return Container(
    height: 90,
    width: 330,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
       color: Color((0xff2A2C36),
    ),
  ),
  child: Row(
    children: [
     Container(
      height: 90,
      width: 100,
      color: Colors.white,
      child: Image.asset(assets,)),
  
     const Column(
      mainAxisAlignment: MainAxisAlignment.start,
       children: [
         Text("Pullover",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w100),),
           SizedBox(height: 5,),
           Text("Mango",style: TextStyle(color: Colors.grey,fontSize: 11),),
             SizedBox(height: 10,),
            Row(
           children: [
             Padding(
               padding: EdgeInsets.only(left: 10),
               child: Text("Color: Gray",style: TextStyle(color: Colors.grey,fontSize: 11),),
             ),
             SizedBox(width: 15,),
              Text("Size: L",style: TextStyle(color: Colors.grey,fontSize: 11),),
           ],
         ),
         SizedBox(height: 10,),
           Row(
           children: [
             Padding(
               padding: EdgeInsets.only(left: 10),
               child: Text("Units: 1",style: TextStyle(color: Colors.grey,fontSize: 11),),
             ),
             
            
           ],
         ),
          
       ],
     ),
      const Row(
            mainAxisAlignment: MainAxisAlignment.end,
             children: [
               Padding(
                 padding: EdgeInsets.only(left: 80,top: 40),
                 child: Text("51\$",style: TextStyle(color: Colors.white,fontSize: 14),),
               ),
             ],
           ),

    ],
  ),
  );

}

Widget _information (){
  return  Padding(
    padding: const EdgeInsets.only(left: 20),
    child: Column(
      children: [
        const Row(
          children: [
            Text("Shipping Address:",style: TextStyle(color: Colors.grey,fontSize: 14),),
            SizedBox(width: 1,),
            Text("3 Newbridge Court ,Chino Hills,\nCA 91709, United States",style: TextStyle(color: Colors.white,fontSize: 14),),
          ],
        ),
            const SizedBox(height: 20,),
            Row(
          children: [
            const Text("Payment method:",style: TextStyle(color: Colors.grey,fontSize: 14),),
            Image.asset("Assets/card.png"),
            const SizedBox(width: 10,),
            const Text("**** **** **** 3947",style: TextStyle(color: Colors.white,fontSize: 14),),
          ],
        ),
              const SizedBox(height: 20,),
        const Row(
          children: [
            Text("Discount:",style: TextStyle(color: Colors.grey,fontSize: 14),),
           
            SizedBox(width: 50,),
            Text("10%, Personal promo code",style: TextStyle(color: Colors.white,fontSize: 14),),
          ],
        ),
           const SizedBox(height: 20,),
        const Row(
          children: [
            Text("Total Amount:",style: TextStyle(color: Colors.grey,fontSize: 14),),
           
            SizedBox(width: 30,),
            Text("133\$",style: TextStyle(color: Colors.white,fontSize: 14),),
          ],
        ),
       const SizedBox(height: 20,),
        
             Row(
           children: [
             Container(
              margin: EdgeInsets.only(left: 5),
              height:40 ,
              width:150,
              decoration: BoxDecoration(
                
                borderRadius: BorderRadius.circular(40),
                border: Border.all(
                  color: Colors.white
                ),
                color: const Color((0xff2A2C36))
              ),
              child:  InkWell(
                   onTap: (){
                   
                   },
                child: const Center(
                  child: Text("Reorder",style: TextStyle(color: Colors.white,fontSize: 14),))),
             ),
             const SizedBox(width: 10,),
              Container(
              margin: EdgeInsets.only(left: 20),
              height:40 ,
              width:150,
              decoration: BoxDecoration(
                
                borderRadius: BorderRadius.circular(40),
               color: Color(0xffEF3651)
              ),
              child:  InkWell(
                   onTap: (){
                   
                   },
                child: const Center(
                  child: Text("Leave feedback",style: TextStyle(color: Colors.white,fontSize: 14),))),
             ),
           ],
         ),
        
        
      ],
    ),
  );
}

}