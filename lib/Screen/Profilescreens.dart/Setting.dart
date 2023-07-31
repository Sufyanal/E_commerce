import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
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
              Text("Personal Information",style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 16,)),
            ],
          ),
        ],
      ),
    );
  }
}