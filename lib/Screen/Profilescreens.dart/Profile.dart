import 'package:ecommerce/Screen/Profilescreens.dart/MyOrder.dart';
import 'package:ecommerce/Screen/Profilescreens.dart/Setting.dart';
import 'package:flutter/material.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.search,color: Colors.white,),
          ),
        ],
        elevation: 0,
      ),
     body:  Center(
       child: Column(
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
           Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 30,
               backgroundImage: AssetImage("Assets/bg.png"),
               
              ),
              SizedBox(width: 10,),
               Column(
                 children: [
                   Text("Matilda Brown",style:Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 18)),
                  Text("matildabrown@mail.com",style:Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 14,color: Colors.grey)),
                 ],
               ),
          
            ],
          ),
         
           const SizedBox(height: 30,),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                     children: [
                       InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const orders()));
                        },
                         child: ListTile(
                       title: Text("My orders",style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 16),),
                       subtitle: Text("Already have 12 orders",style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 11,color: Colors.grey),),
                       trailing: const Icon(Icons.arrow_forward_ios,color: Colors.grey,),
                         ),
                       ),
                       const Divider(height: 2,color: Colors.grey,),
                        InkWell(
                         child: ListTile(
                       title: Text("Shipping addresses",style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 16),),
                       subtitle: Text("3 ddresses",style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 11,color: Colors.grey),),
                       trailing: const Icon(Icons.arrow_forward_ios,color: Colors.grey,),
                         ),
                       ),
                       const Divider(height: 1,color: Colors.grey,),
                        InkWell(
                         child: ListTile(
                       title: Text("Visa  **34",style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 16),),
                       subtitle: Text("Payment methods",style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 11,color: Colors.grey),),
                       trailing: const Icon(Icons.arrow_forward_ios,color: Colors.grey,),
                         ),
                       ),
                       const Divider(height: 1,color: Colors.grey,),
                        InkWell(
                         child: ListTile(
                       title: Text("Promocodes",style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 16),),
                       subtitle: Text("You have special promocodes",style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 11,color: Colors.grey),),
                       trailing: const Icon(Icons.arrow_forward_ios,color: Colors.grey,),
                         ),
                       ),
                       const Divider(height: 1,color: Colors.grey,),
                        InkWell(
                         child: ListTile(
                       title: Text("My reviews",style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 16),),
                       subtitle: Text("Reviews for 4 items",style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 11,color: Colors.grey),),
                       trailing: const Icon(Icons.arrow_forward_ios,color: Colors.grey,),
                         ),
                       ),
                       const Divider(height: 1,color: Colors.grey,),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const Setting()));
                          },
                         child: ListTile(
                       title: Text("Settings",style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 16),),
                       subtitle: Text("Notifications, password",style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 11,color: Colors.grey),),
                       trailing: const Icon(Icons.arrow_forward_ios,color: Colors.grey,),
                         ),
                       ),
                     ],
                   ),
            ),
          ),
           const Divider(height: 1,color: Colors.grey,),
        ],
       ),
     ),
    
    );
  }
}