import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'another.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'Shared Preferences',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {




  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shared Preferences'),
      ),
      body: Center(
         child:RaisedButton(
           child:Text("GO to anther Screen"),
           onPressed:(){
             Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Another()));
           },
         ),
      ),
    );
  }
  setData()async{
    SharedPreferences _pref= await SharedPreferences.getInstance();
    _pref.setString("Name", "Mohamed");
    _pref.setInt("age", 21);
    _pref.setDouble("height", 175.5);
    _pref.setBool("developer", true);
    _pref.setStringList("skills", ["Dart","Flutter"]);
  }
}
