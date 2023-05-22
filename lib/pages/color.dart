import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class MyColor extends StatefulWidget {

  @override
  State<MyColor> createState() => _MyColorState();
}

class _MyColorState extends State<MyColor> {
  bool _darkMode = false;
  bool _fontSize = false;
  double size = 20.0;
  int _color = Colors.white.value;
  @override
  void initState(){
    super.initState();
    getSelectedPref();

  }
  
  @override
  Widget build(BuildContext context) {
    if(_darkMode==true){
      _color=Colors.black.value;
      
    }
    else{
      _color=Colors.white.value;
    }
    if(_fontSize==true){
      size = 38.0;
    }
    else{
      size=25;
    }
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Setting",
          style: TextStyle(
            color: Color(_color),
            fontSize: size,
          ),
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            ListTile(
              title: Text("Dark"),
              leading: Icon(Icons.circle),
              trailing: Switch(
                activeColor: Colors.red,
                value: _darkMode,
                onChanged: (val) async{
                  SharedPreferences pref =await SharedPreferences.getInstance();
                  pref.setBool('dark',val);
                  setState(() {
                    _darkMode=val;
                    print(val);
                  });
                },

              ),
            ),
            ListTile(
              title: Text("x-large font size"),
              leading: Icon(Icons.circle),
              trailing: Switch(
                activeColor: Colors.red,
                value: _fontSize,
                onChanged: (val) async{
                  SharedPreferences pref =await SharedPreferences.getInstance();
                  pref.setBool('font',val);
                  setState(() {
                    _fontSize=val;
                    print(val);
                  });
                },

              ), 
            ),
            Card(
              child: Text("you must need to restart the app to see all changes in all pages"),
            ),
          ],
        ),
      ),
    );
  }
  //functions
  getSelectedPref()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      _darkMode = pref.getBool('dark')!;
      _fontSize = pref.getBool('font')!;
    });
  }
}