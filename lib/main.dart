import 'package:flutter/material.dart';

void main() {
  runApp(BurthDayApp());
}

class BurthDayApp extends StatelessWidget {
  const BurthDayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Birthday App',
      home: Scaffold(
       
            
        body: Image(image:  AssetImage('images/a_dot_burr.jpeg' ) ,
        
        
        
         ),

          
        
       
      ),
      
    );
  }
}   