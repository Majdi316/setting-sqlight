import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  var _favColor =  Colors.white.value;
  var defC = Colors.white.value;
  
  //set function
  saveData(int? color) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();//create object 
     prefs.setInt("favC", color!) ;
  }
  getData() async {
  SharedPreferences  prefs = await SharedPreferences.getInstance();//create object
    setState(() {
      _favColor= prefs.getInt("favC") ?? defC;
    });
  }
  //get function
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(_favColor),
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Center(
        child: Column(
          children: [
            RadioListTile(
              title: Text("Green"),
              value: Colors.green.value,
              groupValue: _favColor,
              onChanged:(var s){
                setState(() {
                  _favColor = s!;
                });
                saveData(s);
              },
            ),
            RadioListTile(
              title: Text("Orange"),
              value: Colors.orange.value,
              groupValue: _favColor,
              onChanged:(var color){
                setState(() {
                  _favColor = color!;
                });
                saveData(color);
              },
            ),
            RadioListTile(
              title: Text("Blue"),
              value: Colors.blue.value,
              groupValue: _favColor,
              onChanged:(var color){
                setState(() {
                  _favColor = color!;
                });
                saveData(color);
              },
            ),
          ],
        ),
      ),
    );
  }
}