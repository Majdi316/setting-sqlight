import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Home1 extends StatefulWidget {
  const Home1({super.key});

  @override
  State<Home1> createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  bool _darkMode = false;
  bool _fontSize = false;
  double s = 20.0;
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
      s= 38.0;
    }
    else{
      s=25;
    }
    print(s);
    print(_color);
    return Scaffold(
      
      appBar: AppBar(
        title:Text(
          "Home page",
          style: TextStyle(
            color:Color(_color), 
            fontSize:s,        
             ),
          ),
        actions: [
          IconButton(
             icon: const Icon(Icons.settings),
             onPressed: () {
              Navigator.of(context).pushNamed('setting');
             },
             ),
        ],
      ),
      body: Container(
        child: Card(
          child: ListTile(
            title: Text('cources'),
            onTap: (){
              Navigator.of(context).pushNamed('corse');
            },
            leading: Icon(Icons.folder),
          ),
        ) ,
      ),
    );
  }
  getSelectedPref()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      _darkMode = pref.getBool('dark')!;
      _fontSize = pref.getBool('font')!;
    });
  }
}