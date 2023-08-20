import 'dart:io';

import 'package:ecommerce/Screen/Register/VisualSearch.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Visual extends StatefulWidget {
  const Visual({super.key});

  @override
  State<Visual> createState() => _VisualState();
}

class _VisualState extends State<Visual> {
 
  File? pickimage;
  
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        elevation: 0,
        title: Text('Visual search',style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 18),),
       leading: IconButton(
            onPressed:() => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back_ios,color: Colors.white,)),
      ),

      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(fit: BoxFit.fill,image: AssetImage("Assets/bg.png"),)
        ),
        width: double.infinity,
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 50,
        ),
         Padding(
           padding: const EdgeInsets.only(top: 200,left: 10),
           child: Text("Search for an outfit by taking \n a photo or uploading an image",
           style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 24),
             ),
         ),
           
            const SizedBox(height: 30,),
            GestureDetector(
              onTap: () async {

                 final ImagePicker picker = ImagePicker();
                  XFile? image = await picker.pickImage(
                        source: ImageSource.camera);
                    print(image?.name);
                    print(image?.path);
                    if (image == null) {
                      setState(() {
                       image = image!;
                      });
                    }
                    if (this.mounted) {
        await Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Splash(
              image: pickimage!
            ),
          ),
        );
      }
              },
              child: Center(
                child: Container(
                  decoration:   BoxDecoration(
                     borderRadius: const BorderRadius.all(Radius.circular(20)),
                     color: Theme.of(context).colorScheme.error
              
                  ),
                  height: 50,
                  width: 320,
                 child: Center(
                   child: Text("TAKE A PHOTO",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white)
                    ),
                 ),
                ),
              ),
            ),      
            const SizedBox(height: 30,),
            GestureDetector(
              onTap: () async {

               final ImagePicker picker = ImagePicker();
                    XFile? image = await picker.pickImage(
                        source: ImageSource.gallery);
                    print(image?.name);
                    print(image?.path);
                    if (image != null) {
                      setState(() {
                      pickimage = File(image.path);
                      });
                    }
                 
         Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Splash(
              image:pickimage!,
            ),
          ),
        );
    
              },
              child: Center(
                child: Container(
                  decoration:    BoxDecoration(
                     borderRadius:  BorderRadius.all(Radius.circular(20)),
                     color: Theme.of(context).colorScheme.error,
                     backgroundBlendMode: BlendMode.screen,
                   
                  ),
                  height: 50,
                  width: 320,
                 child: Center(
                   child: Text("UPLOAD AN IMAGE",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white)
                    ),
                 ),
                ),
              ),
            ),
      ]),
    ));
  }
}