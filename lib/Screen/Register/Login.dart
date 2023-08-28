
import 'package:ecommerce/Screen/Register/Forget.dart';
import 'package:ecommerce/Screen/Register/Visual.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';

import '../../main.dart';
import '../../model.dart/user.dart';
// import 'package:shared_preferences/shared_preferences.dart';




class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController useremailcontroller = TextEditingController();
  TextEditingController userpasswordcontroller = TextEditingController();



  bool _isEmailTextFieldEmpty = true;
  bool passwordVisible = true;
   bool _isTextFieldEmpty = false; // Variable to track if the TextField is empty

  // @override
  // void initState() {
  //   super.initState();
  //   // _Useremailcontroller.addListener(_handleTextFieldChange);
  //   // _Userpasswordcontroller.addListener(_handleTextFieldChange);
    
  // }

 void login(String email, String password) async {
    UserData? userdata;
    try {
      http.Response response = await put(
          Uri.parse('https://ecommerce.salmanbediya.com/users/login'),
          body: {'email': email, 'password': password});
      if (response.statusCode == 200 || response.statusCode == 201) {
       
       toast("Wellcome to Shop");

        print("Successfully Login");
        userdata = userDataFromJson(response.body);
         
        setState(() {
          if (userdata != null) {
             userName = userdata.data!.name!;
          useremail = userdata.data!.useremail!;
          userId = userdata.data!.id!;
          Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
          builder: (BuildContext context) => const Visual()),
      ModalRoute.withName(''),
    );
          }
           
        });
       
      } else {
     setState(() {
              userpasswordcontroller.text ='';   
               showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        backgroundColor: Theme.of(context).colorScheme.secondary,
                        shadowColor: Theme.of(context).colorScheme.secondary,
                        title: const Text("Incomplete Information",style:  TextStyle(color: Colors.white),),
                        content: const Text("Please correct password and email.",style: TextStyle(color: Colors.white),),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context); // Close the dialog
                            },
                            child: const Text("OK",style: TextStyle(color: Colors.white) ,),
                          ),
                        ],
                      );
                    },
                  );
            });
        
      }
    // ignore: empty_catches
    } catch (e) {

    }
  }

  String? email;
  String? password;


  
  

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed:() => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios,color: Colors.white,)),
      ),
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
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
                    onChanged: (value) {
          setState(() {
            _isEmailTextFieldEmpty = value.isEmpty;
          });
        },
                    // enabled: false,
                    controller: useremailcontroller,
                    style: Theme.of(context).textTheme.bodyLarge,
                    textInputAction: TextInputAction.next,
                  decoration:  InputDecoration(
                    
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Icon(
                        _isEmailTextFieldEmpty ? Icons.close:Icons.done,
                        size: 30,
                        color:_isEmailTextFieldEmpty ? const Color(0xffFF2424): const Color(0xff55D85A)
                      ),
                    ),
                     fillColor: const Color(0xff2A2C36),
                    filled: true,
                   hintText: "Email",
                  labelText: "Email",
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                    focusColor: Colors.blue,
                   hintStyle: const TextStyle(
                    color: Color(0xff828282),
                    fontWeight: FontWeight.w400
                   ),
                   border: const OutlineInputBorder(
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
                    controller: userpasswordcontroller,
                   obscuringCharacter: "*",
                       style: Theme.of(context).textTheme.bodyLarge,
                    textInputAction: TextInputAction.done,
                  decoration:  InputDecoration(
                     fillColor: const Color(0xff2A2C36),
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
                         
                             obscureText: passwordVisible, 
                    
                   ),
                ),
               
                ),          
              
               Row(
                mainAxisAlignment: MainAxisAlignment.end,
                   children: [
                     GestureDetector(
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
              GestureDetector(
                onTap: ()  {
                   showDialog(
      context: context,
      builder: (context) {
        return const Center(
            child: CircularProgressIndicator(
          color:Colors.white,
        ));
      },
    );
                   
                   if (!_isTextFieldEmpty) {
        login(
          useremailcontroller.text.toString(),
          userpasswordcontroller.text.toString(),
        );
          }
                   setState(() {
                                _isTextFieldEmpty =  useremailcontroller.text.isEmpty ;
                               _isTextFieldEmpty = userpasswordcontroller.text.isEmpty;
                              });
                              
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
                const SizedBox(height: 50,),
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
      ),
          
        );
  }

  // void _login (BuildContext context) async{
  //    SharedPreferences prefs = await SharedPreferences.getInstance();
    
  //   // Replace with your own login validation logic
    
  //   String savedEmail = prefs.getString('email')?? '';
  //     String savedPassword = prefs.getString('Password')?? '';

  //   String enteredEmail = _Useremailcontroller.text.trim();
  //   String enteredPassword = _Userpasswordcontroller.text.trim();

  //   if (savedEmail == enteredEmail && savedPassword == enteredPassword) {
  //     Navigator.pushReplacementNamed(context, '/home');

  //   }

  // }

   toast (String msg){
    Fluttertoast.showToast(
            msg: msg,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 2,
            backgroundColor: Theme.of(context).colorScheme.secondary,
            textColor: Colors.white,
            fontSize: 16.0);
   }
  
  }
