import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {

  bool isswiched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
       leading: const Icon(Icons.arrow_back_ios,color: Colors.white,),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.search,color: Colors.white,),
          ),
        ],
        elevation: 0,
      ),
        resizeToAvoidBottomInset: false,
      body: Column(
        children: [
            Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10,left: 20),
                child: Text("Settings",style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 34),),
              )
            ],
          ),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Personal Information",style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 16,)),
              ),
            ],
          ),
           const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
                   
                    style: Theme.of(context).textTheme.bodyLarge,
                    textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    
                     fillColor: Color(0xff2A2C36),
                    filled: true,
                   hintText: "Full name",
                 
                   
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
          const SizedBox(height: 20,),
                           Padding(
                             padding:const EdgeInsets.symmetric(horizontal: 10),
                             child: TextField(
                                            
                                             style: Theme.of(context).textTheme.bodyLarge,
                                             textInputAction: TextInputAction.next,
                                           decoration: const InputDecoration(
                                             
                                              fillColor: Color(0xff2A2C36),
                                             filled: true,
                                            hintText: "12/12/1989",
                                           labelText: "Date of Birth",
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
                           const SizedBox(height: 20,),

                            Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Personal Information",style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 16,)),
              ),
            ],
          ),
           const SizedBox(height: 20,),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 10),
             child: TextFormField(
                  
               
                     style: Theme.of(context).textTheme.bodyLarge,
                  textInputAction: TextInputAction.done,
                decoration:  const InputDecoration(
                   fillColor: Color(0xff2A2C36),
                  filled: true,
                 hintText: "*********",
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
                     
               
                  
                 ),
                 
           ),
            const SizedBox(height: 20,),

                            Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Notifications",style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 16,)),
              ),
            ],
          ),

           const SizedBox(height: 20,),

                            Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Sales",style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 16,)),
              ),
              SizedBox(width: 230,),
              
              Switch(
                activeColor: Color(0xff55D85A),
                activeTrackColor: Color(0xff55D85A) ,
                inactiveThumbColor: Color(0xff55D85A) ,
                value: isswiched, 
                onChanged: (value){
               isswiched = value;
                })
            ],
          ),

           const SizedBox(height: 20,),

                            Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("New arrivals",style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 16,)),
              ),
               SizedBox(width: 180,),
              
              Switch(
                activeColor: Color(0xff2A2C36),
                activeTrackColor: Color(0xff2A2C36) ,
                inactiveThumbColor:  Color(0xff2A2C36) ,
                value: isswiched, 
                onChanged: (value){
               isswiched = value;
                })
            ],
          ),

           const SizedBox(height: 10,),

                            Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Delivery status changes",style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 16,)),
              ),
               SizedBox(width: 90,),
              
              Switch(
                activeColor: Color(0xff2A2C36),
                activeTrackColor: Color(0xff2A2C36) ,
                inactiveThumbColor:  Color(0xff2A2C36) ,
                value: isswiched, 
                onChanged: (value){
               isswiched = value;
                })
            ],
          ),
           
        ],
      ),
    );
  }
}