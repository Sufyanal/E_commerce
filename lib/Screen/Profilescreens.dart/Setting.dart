import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {

  DateTime? _selectedDate;
  
  Future<void> _pickDate() async {
  final pickedDate = await showDatePicker(
    context: context,
    initialDate: _selectedDate ?? DateTime.now(),
    firstDate: DateTime(1900),
    lastDate: DateTime.now(),
      builder:( context, child) {
                   return Theme(
                    data: Theme.of(context).copyWith(
                    colorScheme: ColorScheme.light(
                       primary: Color(0xff363636),
                       onPrimary: Colors.white,
                       onSurface: Colors.white,
                       ),
                       dialogBackgroundColor: Color(0xff363636),
                       textButtonTheme: TextButtonThemeData(
                        style: TextButton.styleFrom(
                          backgroundColor: Color(0xff363636),
                          foregroundColor: Colors.white,
                          textStyle: Theme.of(context).textTheme.bodySmall,
                          primary: Colors.white,
    
                        ),
                       ),),
                    child: child!);
                  },
  );

  if (pickedDate != null && pickedDate != _selectedDate) {
    setState(() {
      _selectedDate = pickedDate;
    });
  }
}


   bool isSwitchedSales = false;
  bool isSwitchedNewArrivals = false;
  bool isSwitchedDeliveryStatus = false;

  void _updateSwitchStates(String switchName, bool newValue) {
    setState(() {
      if (switchName == 'sales') {
        isSwitchedSales = newValue;
        if (newValue) {
          isSwitchedNewArrivals = false;
          isSwitchedDeliveryStatus = false;
        }
      } else if (switchName == 'newArrivals') {
        isSwitchedNewArrivals = newValue;
        if (newValue) {
          isSwitchedSales = false;
          isSwitchedDeliveryStatus = false;
        }
      } else if (switchName == 'deliveryStatus') {
        isSwitchedDeliveryStatus = newValue;
        if (newValue) {
          isSwitchedSales = false;
          isSwitchedNewArrivals = false;
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        leading: IconButton(
            onPressed:() => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios,color: Colors.white,)),
        elevation: 0,
      ),
        resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
                             child: GestureDetector(
                              onTap: (){
                                _pickDate();
                              },
                               child: AbsorbPointer(
                                 child: TextField(
                                  controller: TextEditingController(
                text: _selectedDate != null
                    ? DateFormat('MM/dd/yyyy').format(_selectedDate!)
                    : '',
              ),
                                                
                                                 style: Theme.of(context).textTheme.bodyLarge,
                                                 textInputAction: TextInputAction.next,
                                               decoration: const InputDecoration(
                                                   suffixIcon: Icon(Icons.calendar_today),
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
               activeColor: Color(0xff55D85A) ,
                activeTrackColor: Color(0xff2A2C36) ,
                inactiveThumbColor:  Color(0xff2A2C36) ,
                 value: isSwitchedSales,
                onChanged: (value){
               
               setState(() {
                _updateSwitchStates( 'sales',value);
                
               });
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
               activeColor: Color(0xff55D85A) ,
                activeTrackColor: Color(0xff2A2C36) ,
                inactiveThumbColor:  Color(0xff2A2C36) ,
                value: isSwitchedNewArrivals, 
                onChanged: (value){
              _updateSwitchStates( 'newArrivals',value);
                })
            ],
          ),

           const SizedBox(height: 10,),

                            Row(
          
            children:<Widget> [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Delivery status changes",style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 16,)),
              ),
               SizedBox(width: 90,),
              
            
              Switch(
                activeColor: Color(0xff55D85A) ,
                activeTrackColor: Color(0xff2A2C36) ,
                inactiveThumbColor:  Color(0xff2A2C36) ,
               value:isSwitchedDeliveryStatus,
                onChanged: (bool value){
              _updateSwitchStates( 'deliveryStatus',value);
              
                })
            ],
          ),
           
        ],
      ),
    );
  }
}