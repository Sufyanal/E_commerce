
import 'package:ecommerce/Favoraite/favorate.dart';
import 'package:ecommerce/Screen/HOMe/mainScreen.dart';
import 'package:ecommerce/Screen/profilescreens.dart/profile.dart';
import 'package:ecommerce/Screen/SHops/Shop.dart';
import 'package:ecommerce/Screen/BAGS/bags.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  
   const Home({Key? key, }) : super(key: key);

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
 
int currentIndex = 0;
  final List<Widget> tabs =[    
   const Main(),
   const Shop(),
   const Bags(cart: [],),
   const Favorate(favorite: [],),
   const Profile(),  
  ];
  
 
  @override
  Widget build(BuildContext context) {
   return WillPopScope(
    onWillPop: ()async=> false,
     child: Scaffold(
       backgroundColor: Theme.of(context).colorScheme.primary,
       bottomNavigationBar:  Container(                                             
     decoration: const BoxDecoration(                                                   
      borderRadius: BorderRadius.only(                                           
        topRight: Radius.circular(30), topLeft: Radius.circular(30)),            
      boxShadow: [                                                               
        BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),       
      ],                                                                         
     ),
         child: ClipRRect(
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
           child: BottomNavigationBar(
            
         
             
               mouseCursor: MouseCursor.uncontrolled,
                backgroundColor: const Color(0xff1A1B20),
                items: const [
                  
                  BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: "Home",tooltip: "Home"),
                   BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined),label: 'Shop',tooltip: "Buy NOW"),
                    BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined),label: 'Bags',tooltip: "Check OUT"),
                     BottomNavigationBarItem(icon: Icon(Icons.favorite_outline),label: 'Favorite',tooltip: "YOUR FAVORITE"),
                      BottomNavigationBarItem(icon: Icon(Icons.person_outline),label: 'Profile',tooltip: "Profile"),
                ],
                  currentIndex: currentIndex,
                  onTap: ( ontapped){
                  setState(() {
                        currentIndex = ontapped;
                  });
                   
                },
             type: BottomNavigationBarType.fixed,
                
                selectedItemColor: const Color(0xffEF3651),
                unselectedItemColor: Colors.grey,
              
                ),
         ),
       ),
            body: tabs[currentIndex],
            
     ),
   );
  }
}