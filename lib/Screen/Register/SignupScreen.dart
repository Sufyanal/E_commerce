// import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:ecommerce/Screen/Register/Login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
// import 'package:shared_preferences/shared_preferences.dart';


class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SingupState();
}

class _SingupState extends State<SignupScreen> {
  TextEditingController usernamecontroller = TextEditingController();
    TextEditingController useremailcontroller = TextEditingController();
  TextEditingController userpasswordcontroller = TextEditingController();

  bool passwordVisible = true;
  bool _isTextFieldEmpty = false; // Variable to track if the TextField is empty
  bool _isEmailTextFieldEmpty = true;
   bool _isNameTextFieldEmpty = true;

   final _emailformKey = GlobalKey<FormState>();
  final _passwordformKey = GlobalKey<FormState>();
  final _nameformkey = GlobalKey<FormState>();

   bool shouldAutoValidateName = false;
  bool shouldAutoValidateEmail = false;
  bool shouldAutoValidatePassword = false;

  // @override
  // void initState() {
  //   super.initState();
  //   _Usernamecontroller.addListener(_handleTextFieldChange);
  //  _Useremailcontroller.addListener(_handleTextFieldChange);
  //   _Userpasswordcontroller.addListener(_handleTextFieldChange);
    
  // }

  // void _handleTextFieldChange() {
  //   // Update the _isTextFieldEmpty variable based on the TextField's content
  //   setState(() {
  //     _isTextFieldEmpty = _Usernamecontroller.text.isEmpty;
  //     _isTextFieldEmpty = _Useremailcontroller.text.isEmpty;
  //     _isTextFieldEmpty = _Userpasswordcontroller.text.isEmpty;
  //   });
  // }
    void login(String name, String email, String password) async {
    try {
      http.Response response = await post(
          Uri.parse('https://ecommerce.salmanbediya.com/users/register'),
          body: {'name': name, 'email': email, 'password': password});
      if (response.statusCode == 201) {
       toast("Login Sucessfull");
       setState(() {
           Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) {
              return Login();
            },
          ),
        );
       });
      
      } else {
        const Text(
          'Failed',
          style: TextStyle(color: Colors.white),
        );
        print("Failed");
        toast("Please correct information");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  String? email;
  String? password;
 

  
  String? _password;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed:() => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back_ios,color: Colors.white,)),
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Column(
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
      
             Form(
                key: _nameformkey,
                      autovalidateMode: shouldAutoValidateName
                          ? AutovalidateMode.onUserInteraction
                          : AutovalidateMode.disabled,
               child: SingleChildScrollView(
                 child: TextFormField(
                   onChanged: (value){
                     setState(() {
                       _isNameTextFieldEmpty = value.isEmpty;
                     });
                     
                   },
                    onFieldSubmitted: (p0) {
                       setState(() {
                         shouldAutoValidateName = true;
                       });
                     },
                       validator: (value) {
                       if (value!.isEmpty) {
                         return 'This field is required';
                       } else if (value.length < 3) {
                         return 'This field requires a minimum of 3 characters';
                       } else {
                         return null;
                       }
                     },
                   controller:  usernamecontroller,
                   style: Theme.of(context).textTheme.bodyLarge,
                   textInputAction: TextInputAction.next,
                 decoration: InputDecoration(
                    suffixIcon: Padding(
                     padding:  EdgeInsets.only(right: 10),
                     child: Icon(
                       _isNameTextFieldEmpty ? Icons.close:Icons.done,
                       size: 30,
                       color:_isNameTextFieldEmpty ? const Color(0xffFF2424) :const Color(0xff55D85A)
                     ),
                   ),
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
      
               Form(
                 key: _emailformKey,
                    autovalidateMode: shouldAutoValidateEmail
                        ? AutovalidateMode.onUserInteraction
                        : AutovalidateMode.disabled,
                 child: SingleChildScrollView(
                   child: TextFormField(
                       onChanged: (value) {
                         setState(() {
                           _isEmailTextFieldEmpty = value.isEmpty;
                         });
                       },
                        onFieldSubmitted: (p0) {
                          setState(() {
                            shouldAutoValidateEmail = true;
                          });
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'This field is required';
                          } else if (!value.contains('@gmail.com')) {
                            return 'Not a valid email address. Should be your@email.com';
                          } else {
                            return null;
                          }
                        },
                     controller: useremailcontroller,
                        style: Theme.of(context).textTheme.bodyLarge,
                     textInputAction: TextInputAction.next,
                   decoration:  InputDecoration(
                      suffixIcon: Padding(
                       padding: const EdgeInsets.only(right: 10),
                       child: Icon(
                         
                         _isEmailTextFieldEmpty ? Icons.close:Icons.done,
                         size: 30,              
                         color:_isTextFieldEmpty ? const Color(0xffFF2424) :const Color(0xff55D85A)
                       ),
                     ),
                     fillColor: const Color(0xff2A2C36),
                     filled: true,
                     labelText: "Email",
                     labelStyle: const TextStyle(
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
               ),
                const SizedBox(height:5 ,),
                   Form(
                     key: _passwordformKey,
                    autovalidateMode: shouldAutoValidatePassword
                        ? AutovalidateMode.onUserInteraction
                        : AutovalidateMode.disabled,
                     child: SingleChildScrollView(
                       child: TextFormField(
                         controller: userpasswordcontroller,
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
                                  onFieldSubmitted: (p0) {
                        setState(() {
                          shouldAutoValidatePassword = true;
                        });
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'This field is required';
                        } else if (value.trim().length < 6) {
                          return 'Password must require a minimum of 6 characters';
                        } else {
                          return null;
                        }
                      },
                                  obscureText: passwordVisible,
                                  
                         
                        ),
                     ),
                   ),          
              
               Row(
                mainAxisAlignment: MainAxisAlignment.end,
                   children: [
                     GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                      },
                       child: const Text("Already have an account?",
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
             var test = _nameformkey.currentState!.validate();
                      var test1 = _emailformKey.currentState!.validate();
                      var test2 = _passwordformKey.currentState!.validate();
                   
                   if (!_isTextFieldEmpty && test && test1 && test2) {
        login(
          usernamecontroller.text.toString(),
          useremailcontroller.text.toString(),
          userpasswordcontroller.text.toString(),
        );
          }
                   setState(() {
                                _isTextFieldEmpty =  useremailcontroller.text.isEmpty ;
                               _isTextFieldEmpty = userpasswordcontroller.text.isEmpty;
                               _isTextFieldEmpty = usernamecontroller.text.isEmpty;
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
      ),
          
        );
  }

  // void _signup (BuildContext context) async{
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String enteredName = _Usernamecontroller.text.trim();
  //   String enteredEmail = _Useremailcontroller.text.trim();
  //   String enteredPassword = _Userpasswordcontroller.text.trim();
    
  //   // Save user information in Shared Preference
  //   prefs.setString("Name", enteredName);
  //   prefs.setString("email", enteredEmail);
  //   prefs.setString("Password", enteredPassword);

  //   _isTextFieldEmpty? null: Navigator.pushReplacementNamed(context, '/login');

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
