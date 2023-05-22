import 'package:flutter/material.dart';
import 'package:setting/dbhelper.dart';
import 'package:setting/model/courses.dart';
import 'package:setting/pages/course.dart';
class NewCors extends StatefulWidget {
  

  @override
  State<NewCors> createState() => _NewCorsState();
}

class _NewCorsState extends State<NewCors> {
  String name="mm";
  int hours=10;
  String content=":";
  DbHelper? helper;
  @override
  void initState(){
    super.initState();
    helper=DbHelper();
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('new corse'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          child: Column(
            children: [
              
              TextFormField(
                decoration: InputDecoration(
                  hintText: "enter course name",
                 ),
                 onChanged: ((value) {
                   setState(() {
                     name = value;
                     print(name);
                   });
                 }),

              ),
              SizedBox(height: 15,),
              TextFormField(
                maxLines: 10,
                decoration: InputDecoration(
                  hintText: "enter course content",
                 ),
                 onChanged: ((value) {
                   setState(() {
                     content = value;
                   });
                 }),
              ),
              SizedBox(height: 15,),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "enter course hours",
                 ),
                 onChanged: ((value) {
                   setState(() {
                     hours = int.parse(value);
                   });
                 }),
              ),
              SizedBox(height: 15,),
              ElevatedButton(
                child: Text('Save'),
                onPressed: ()async{
                  Courses c = Courses({'name':name,'content':content,'hours':hours});
                 int id= await  helper!.createCourses(c);
                 Navigator.of(context).pop();
                 print(name);
                }
              ),
            ],
          ),
          
        ),
      ),
      
      
    );
  }
}