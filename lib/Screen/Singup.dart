import 'dart:io';

import 'package:ecommerce/Screen/Login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Singup extends StatefulWidget {
  const Singup({super.key});

  @override
  State<Singup> createState() => _SingupState();
}

class _SingupState extends State<Singup> {
  final Usernamecontroller = TextEditingController();
  final Useremailcontroller = TextEditingController();
  final Userpasswordcontroller = TextEditingController();


  bool passwordVisible = false;
 
   SaveData(String Usernamecontroller,String Useremailcontroller,String Userpasswordcontroller)async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("Name", Usernamecontroller);
    prefs.setString("Name", Useremailcontroller);
    prefs.setString("Name", Userpasswordcontroller);
   }

   ShowData(String Usernamecontroller,String Useremailcontroller,String Userpasswordcontroller)async{
    final prefs = await SharedPreferences.getInstance();
    setState(() {
     prefs.getString( Usernamecontroller);
     prefs.getString( Useremailcontroller);
     prefs.getString( Userpasswordcontroller);
    });
     
   
   
   }
   
 
   

  
  
  String? _password;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        elevation: 0,
        leading: InkWell(
          onTap: () {
            // Navigator.push(context, MaterialPageRoute(builder:(context)=>const Singup()));
          },
          child: Icon(Icons.arrow_back_ios,color: Colors.white,)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 10,),
           Padding(
             padding: const EdgeInsets.only(right: 180,),
             child: Column(
              mainAxisAlignment:MainAxisAlignment.start ,
               children: [
                 Text("Sign up",
                   style:Theme.of(context).textTheme.bodyMedium,
                   ),
               ],
             ),
           ),
           const SizedBox(height: 40,),

           Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: TextField(
                controller:  Usernamecontroller,
                style: Theme.of(context).textTheme.bodyLarge,
                textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                
                 fillColor: Color(0xff2A2C36),
                filled: true,
               hintText: "Full name",
              labelText: "Name",
                labelStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
                focusColor: Colors.blue,
               hintStyle: TextStyle(
                color: Color(0xff828282),
                fontWeight: FontWeight.w400
               ),
               border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xff828282),
                ),
                borderRadius: BorderRadius.all(Radius.circular(10))
               ),
               
              ),
                         ),
            ),
             const SizedBox(height: 10,),

             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: TextField(
                controller: Useremailcontroller,
                   style: Theme.of(context).textTheme.bodyLarge,
                textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                fillColor: Color(0xff2A2C36),
                filled: true,
                labelText: "Email",
                labelStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
               hintText: "Email Address",
               hintStyle: TextStyle(
                color: Color(0xff828282),
                fontWeight: FontWeight.w400
               ),
               border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xff828282),
                ),
                borderRadius: BorderRadius.all(Radius.circular(10))
               ),
              ),          ),
            ),
              const SizedBox(height:5 ,),
                 Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: TextFormField(
                controller: Userpasswordcontroller,
               obscuringCharacter: "*",
                   style: Theme.of(context).textTheme.bodyLarge,
                textInputAction: TextInputAction.done,
              decoration:  InputDecoration(
                 fillColor: Color(0xff2A2C36),
                filled: true,
                suffixIcon: IconButton(
                  onPressed: (){
                    setState(() {
                      passwordVisible = !passwordVisible;
                    });
                  },
                   icon: Icon(passwordVisible
                   ? Icons.visibility_off
                   : Icons.visibility,color: Colors.white,
                   )
                   ),
               hintText: "Password",
               hintStyle: const TextStyle(
                color: Color(0xff828282),
                fontWeight: FontWeight.w400),
                  border:  const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xff828282),
                ),
                borderRadius: BorderRadius.all(Radius.circular(10))
               ),
                 ),
           validator: (val) => val!.length < 6 ? 'Password too short.' : null,
              onSaved: (val) => _password = val,
             obscureText: passwordVisible,
             
                
               ),
             
              ),          
            
             Row(
              mainAxisAlignment: MainAxisAlignment.end,
                 children: [
                   const Text("Already have an account?",
                     style:TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                     )
                     ),
                     Icon(Icons.arrow_forward,color: Theme.of(context).colorScheme.error,)
                 ],
               ),
             
            const SizedBox(height: 30,),
            InkWell(
             
              onTap: () async {
            
                
              
                 Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>const Login() ));
               },
               
                
            
                
              
              child: Container(
                decoration:   BoxDecoration(
                   borderRadius: const BorderRadius.all(Radius.circular(20)),
                   color: Theme.of(context).colorScheme.error

                ),
                height: 50,
                width: 320,
               child: Center(
                 child: Text("SIGN UP",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white)
                  ),
               ),
              ),
            ),
               const SizedBox(height: 10,),
              Text("Or sign up with social account",style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 14),),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white
                    ),
                     child: Image.asset("Assets/12.png"),
                  ),
                  const SizedBox(width: 20,),
                   Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white
                    ),
                    child: Image.asset("Assets/13.png"),
                  )
                ],

              )
               ],
             ),
          
        );
  }
  
  }
