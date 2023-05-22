import 'package:flutter/material.dart';
import 'package:setting/pages/color.dart';
import 'package:setting/pages/course.dart';
import 'package:setting/pages/h.dart';
import 'package:setting/pages/newcors.dart';


void main() {
 return runApp(  MyApp());
}

class MyApp extends StatelessWidget {
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home1(),
      routes: {
        'setting':(context) {
          return MyColor();
        },
        'corse':(context) {
          return Course();
        },
        'new':(context) {
          return NewCors();
        },
      },
    );
  }  
}
