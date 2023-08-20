import 'package:flutter/material.dart';


class Forget extends StatefulWidget {
  const Forget({super.key});

  @override
  State<Forget> createState() => _ForgetState();
}

class _ForgetState extends State<Forget> {
  



  

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 10,),
           Padding(
             padding: const EdgeInsets.only(right: 180,),
             child: Column(
              mainAxisAlignment:MainAxisAlignment.start ,
               children: [
                 Text("Forgot password",
                   style:Theme.of(context).textTheme.bodyMedium,
                   ),
               ],
             ),
           ),
           const SizedBox(height: 40,),
           Text("Please, enter your email address. You will receive a link to create a new password via email.",
           style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize:14 ),
           ),
              const SizedBox(height:5 ,),
                 Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: TextFormField(
                
             
                   style: Theme.of(context).textTheme.bodyLarge,
                textInputAction: TextInputAction.done,
              decoration:  const InputDecoration(
                 fillColor: Color(0xff2A2C36),
                filled: true,
                // suffixIcon: IconButton(
                //   onPressed: (){
                //     setState(() {
                //       passwordVisible = !passwordVisible;
                //     });
                //   },
                //    icon: Icon(passwordVisible
                //    ? Icons.visibility_off
                //    : Icons.visibility,color: Colors.white,
                //    )
                //    ),
               hintText: "Password",
               hintStyle: TextStyle(
                color: Color(0xff828282),
                fontWeight: FontWeight.w400),
                  border:  OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xff828282),
                ),
                borderRadius: BorderRadius.all(Radius.circular(10))
               ),
                 ),
          //  validator: (val) => val!.length < 6 ? 'Password too short.' : null,
          //     onSaved: (val) => _password = val,
          //    obscureText: passwordVisible,
             
                
               ),
             
              ),          
            
            
            const SizedBox(height: 30,),
            GestureDetector(
              onTap: () async {

               
              },
              child: Container(
                decoration:   BoxDecoration(
                   borderRadius: const BorderRadius.all(Radius.circular(20)),
                   color: Theme.of(context).colorScheme.error

                ),
                height: 50,
                width: 320,
               child: Center(
                 child: Text("Send",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white)
                  ),
               ),
              ),
            ),
              
               ],
             ),
          
        );
  }
  
  }