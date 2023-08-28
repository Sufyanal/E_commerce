import 'package:ecommerce/Screen/BAGS/checkOut.dart';
import 'package:flutter/material.dart';
import '../../model.dart/Checkoutmodel.dart';
import '../../widget/button.dart';

class Address extends StatefulWidget {
  const Address({super.key});

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {

   String? name,city,country,address,code,state;
    Checkout? shippingAddress1;

@override
void initState() {
  super.initState();
  setState(() {
    name = name;
  address = address;
  city = city; 
  state = state;
  code = code;
  country = country;
  });}
 List <CheckOut> addressList = [];  
   void adddetail(String name ,String address,String city,String state,String code,String country,){
    Checkout   shippingAddress = Checkout(
    name: name,
    address: address,
    city: city,
    state: state,
    code: code,
    country: country,
  );
  addressList.add(shippingAddress as CheckOut);
   Navigator.pop(context);
   
  }
   
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
       backgroundColor: Theme.of(context).colorScheme.primary,
     appBar: AppBar( 
          leading: IconButton(
            onPressed:() => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios,color: Colors.white,)),
           
           title: Text("Adding Shipping Address",style: Theme.of(context).textTheme.bodyLarge,),
     ),
      
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,top: 5),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              textField(name,"Full name"),
              const SizedBox(height: 20,),
              textField(address,"Address"),
                const SizedBox(height: 20,),
              textField(city,"City"),
                const SizedBox(height: 20,),
              textField(state,"State/Province/Region"),
                const SizedBox(height: 20,),
              textField(code,"Zip Code (Postal Code)"),
                const SizedBox(height: 20,),
              textField(country,"Country"),
              
               const SizedBox(height: 20,),
               savebutton("Save", 
               () {
              
                
              if (name != null && address != null && city != null && state != null && code != null && country != null) {
          setState(() {
            adddetail(name!, address!, city!,  state!, code!,country!,);
          });
          Navigator.pop(context); 
              } else {
               showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Incomplete Information"),
                        content: const Text("Please fill in all the address details."),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context); // Close the dialog
                            },
                            child: const Text("OK"),
                          ),
                        ],
                      );
                    },
                  );
              }
            },
                    
             
                  
                )
        
            ],
          ),
        ),
      ),

    );
  }
 
 TextField textField(model,hint){
  return TextField(
            textInputAction: TextInputAction.next,
            onChanged:( (value){
              setState(() {
                 model = value;
                
              });
               
            }),
            autofocus: true,
            cursorColor:Theme.of(context).colorScheme.secondary,
            style: Theme.of(context).textTheme.bodyLarge,
            decoration: InputDecoration(
              fillColor: Theme.of(context).colorScheme.secondary,
              filled: true,
              hintText: hint,
              labelText: hint ,
              hintStyle:Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey,fontSize: 11),
               labelStyle:Theme.of(context).textTheme.bodyLarge,
            focusedBorder:  OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary )),
            enabledBorder:  OutlineInputBorder(
              borderSide: BorderSide(color:Theme.of(context).colorScheme.secondary,))
          ),
          );
 }

  Widget savebutton(String name,VoidCallback onPressed){
    return   Button(name: name, onPressed: onPressed);
  }

}