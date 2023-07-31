import 'package:ecommerce/Screen/Homepage.dart';
import 'package:ecommerce/Screen/Profilescreens.dart/MyOrder.dart';
import 'package:ecommerce/Screen/Profilescreens.dart/OrderDetail.dart';
import 'package:ecommerce/Screen/Profilescreens.dart/Setting.dart';
import 'package:ecommerce/Screen/Singup.dart';
import 'package:ecommerce/Screen/Visual.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Screen/Home_Screen.dart';
import 'Screen/Login.dart';





void main() {

  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       initialRoute: '/signup', 
       routes: {
         '/signup': (context) => Singup(),
        '/login': (context) => Login(), 
        '/home': (context) => Visual(),
      },
      title: 'Flutter Demo',
      
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Color(0xff1E1F28)
        ),
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
           primary:Color(0xff1E1F28),
          onPrimary: Colors.black,
          secondary: Color(0xff2A2C36),
           onSecondary: Colors.grey,
            error: Color(0xffEF3651), 
            onError: Colors.white, 
            background: Colors.grey, 
            onBackground: Colors.white,
             surface: Colors.white, 
             onSurface: Colors.black),

       textTheme: TextTheme(
        bodyMedium:  GoogleFonts.dmSans(
              fontSize: 34,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
            bodySmall: GoogleFonts.lato(
             fontSize: 17,
             color: Colors.black,
             fontWeight: FontWeight.w600,
            ),
             bodyLarge: GoogleFonts.metrophobic(
             fontSize: 19,
             color: Colors.white,
             fontWeight: FontWeight.w400,
            )
       )
      ),
      home: const Singup(),
      debugShowCheckedModeBanner: false,
    );
  }
}

