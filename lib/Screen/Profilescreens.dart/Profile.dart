import 'dart:convert';

import 'package:ecommerce/Screen/Profilescreens.dart/MyOrder.dart';
import 'package:ecommerce/Screen/Profilescreens.dart/Setting.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import '../../model.dart/Review.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {

   User? user; // User object to store fetched user data

  @override
  void initState() {
    super.initState();
    fetchUserData(); // Call the method to fetch user data
  }

  Future<void> fetchUserData() async {
    try {
      http.Response response = await put(
        Uri.parse('https://ecommerce.salmanbediya.com/users/login'),
        // Add any required headers or query parameters
      );

      if (response.statusCode == 200) {
        // Assuming your API response is in JSON format
        // Parse the response JSON and set user data
        setState(() {
          user = User.fromJson(jsonDecode(response.body));
        });
      } else {
        // Handle error cases
      }
    } catch (e) {
      // Handle exceptions
    }
  }

  String? email;
  String? password;


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
               if (user != null) ...[
      Column(
        children: [
          Text("${user!.name}", style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 18)),
          Text("${user!.email}", style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 14, color: Colors.grey)),
        ],
      ),
    ] else ...[
      CircularProgressIndicator(), // Display a loading indicator
    ],
          
            ],
          ),
         
           const SizedBox(height: 30,),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                     children: [
                       GestureDetector(
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
                        GestureDetector(
                         child: ListTile(
                       title: Text("Shipping addresses",style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 16),),
                       subtitle: Text("3 ddresses",style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 11,color: Colors.grey),),
                       trailing: const Icon(Icons.arrow_forward_ios,color: Colors.grey,),
                         ),
                       ),
                       const Divider(height: 1,color: Colors.grey,),
                        GestureDetector(
                         child: ListTile(
                       title: Text("Visa  **34",style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 16),),
                       subtitle: Text("Payment methods",style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 11,color: Colors.grey),),
                       trailing: const Icon(Icons.arrow_forward_ios,color: Colors.grey,),
                         ),
                       ),
                       const Divider(height: 1,color: Colors.grey,),
                        GestureDetector(
                         child: ListTile(
                       title: Text("Promocodes",style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 16),),
                       subtitle: Text("You have special promocodes",style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 11,color: Colors.grey),),
                       trailing: const Icon(Icons.arrow_forward_ios,color: Colors.grey,),
                         ),
                       ),
                       const Divider(height: 1,color: Colors.grey,),
                        GestureDetector(
                         child: ListTile(
                       title: Text("My reviews",style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 16),),
                       subtitle: Text("Reviews for 4 items",style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 11,color: Colors.grey),),
                       trailing: const Icon(Icons.arrow_forward_ios,color: Colors.grey,),
                         ),
                       ),
                       const Divider(height: 1,color: Colors.grey,),
                        GestureDetector(
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