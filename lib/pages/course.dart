import 'package:flutter/material.dart';
import 'package:setting/dbhelper.dart';

import '../model/courses.dart';

class Course extends StatefulWidget {
  

  @override
  State<Course> createState() => _CourseState();
}

class _CourseState extends State<Course> {
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
        title: Text('courses'),
        actions: [
          IconButton(
             icon: Icon(Icons.add),
             onPressed: (){
              Navigator.of(context).pushNamed('new');
             },
             )
        ],
      ),
      body: FutureBuilder(
        future: helper!.allCourses(),
        builder: (context, snapshot) {
          if(!snapshot.hasData){
            return CircularProgressIndicator();
          }else{
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: ((context, index) {
                Courses c= Courses.fromMapp(snapshot.data![index]);
                
                
                return ListTile(
                  title: Text('${c.name}---------> hours:${c.hours}'),
                  subtitle: Text(c.content),
                  
                );
              }),
            );
          }
        },
      ),
    );
  }
}