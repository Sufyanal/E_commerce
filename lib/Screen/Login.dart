
import 'package:ecommerce/Screen/Register.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';




class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _Usernamecontroller = TextEditingController();
  TextEditingController _Userpasswordcontroller = TextEditingController();




  bool passwordVisible = true;
   bool _isTextFieldEmpty = true; // Variable to track if the TextField is empty

  @override
  void initState() {
    super.initState();
    _Usernamecontroller.addListener(_handleTextFieldChange);
    _Userpasswordcontroller.addListener(_handleTextFieldChange);
    
  }

  void _handleTextFieldChange() {
    // Update the _isTextFieldEmpty variable based on the TextField's content
    setState(() {
      _isTextFieldEmpty = _Usernamecontroller.text.isEmpty;
      _isTextFieldEmpty = _Userpasswordcontroller.text.isEmpty;
    });
  }
 



  
  
  String? _password;
 
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
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 10,),
           Padding(
             padding: const EdgeInsets.only(right: 180,),
             child: Column(
              mainAxisAlignment:MainAxisAlignment.start ,
               children: [
                 Text("Login",
                   style:Theme.of(context).textTheme.bodyMedium,
                   ),
               ],
             ),
           ),
           const SizedBox(height: 40,),
           Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: SingleChildScrollView(
                child: TextField(
                  
                  // enabled: false,
                  controller: _Usernamecontroller,
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
            ),
             const SizedBox(height: 10,),

                 Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: SingleChildScrollView(
                child: TextFormField(
                //  enabled: false,
                  controller: _Userpasswordcontroller,
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
             
              ),          
            
             Row(
              mainAxisAlignment: MainAxisAlignment.end,
                 children: [
                   InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: ((context) => const Forget())));
                    },
                     child: const Text("Forgot your password?",
                       style:TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                       )
                       ),
                   ),
                     Icon(Icons.arrow_forward,color: Theme.of(context).colorScheme.error,)
                 ],
               ),
             
            const SizedBox(height: 30,),
            InkWell(
              onTap: ()  {

                _login(context);
       
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
              SizedBox(height: 50,),
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

  void _login (BuildContext context) async{
     SharedPreferences prefs = await SharedPreferences.getInstance();
    
    // Replace with your own login validation logic
    
    String savedName = prefs.getString('Name')?? '';
      String savedPassword = prefs.getString('Password')?? '';

    String enteredName = _Usernamecontroller.text.trim();
    String enteredPassword = _Userpasswordcontroller.text.trim();

    if (savedName == enteredName && savedPassword == enteredPassword) {
      Navigator.pushReplacementNamed(context, '/home');

    }else{
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
       builder: (context)=>
        AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30))
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text("Error",style: Theme.of(context).textTheme.bodyLarge,),
          content: Text('Invalid Password. Please try again',style: Theme.of(context).textTheme.bodyLarge,),
          actions: [
            TextButton(
              onPressed: (){
                Navigator.pop(context);
              },
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: Text("OK",style: Theme.of(context).textTheme.bodyLarge,),
             )),
          ],
        )
       );
    }

  }
  
  }
