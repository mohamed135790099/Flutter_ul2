import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyAnother extends StatelessWidget {
  const MyAnother({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title:'Shared Preferences',
      home:Another(),
    );
  }
}


class Another extends StatefulWidget {
  const Another({Key? key}) : super(key: key);

  @override
  _AnotherState createState() => _AnotherState();
}

class _AnotherState extends State<Another> {
  String _name = "";
  int _age = 0;
  double _height = 0.0;
  bool _developer = false;
  List<String> _skills = ["", ""];
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    deleteData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:Text("Shared Preferences"),),
      body:Center(
        child: DefaultTextStyle(
          child: Column(
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
              Text("Name:"+_name),
              Text("Age: $_age"),
              Text("Height:$_height"),
              Text("Developer:$_developer"),
              Text("Skills 1:"+_skills[0]),
              Text("Skills 2:"+_skills[1]),
              RaisedButton(
                  child:Text('Get Data'),
                  onPressed: (){
                    getData();
                  }),
            ],
          ),
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
  deleteData()async{
    SharedPreferences _pref= await SharedPreferences.getInstance();
       _pref.remove("Name");
       _pref.remove("age");
       _pref.remove("height");
       _pref.remove("developer");
       _pref.remove("skills");

  }

  getData()async{
    SharedPreferences _pref= await SharedPreferences.getInstance();
    setState(() {
    _name = _pref.getString("Name")!;
    _age= _pref.getInt("age")!;
    _height=_pref.getDouble("height")!;
    _developer=_pref.getBool("developer")!;
    _skills= _pref.getStringList("skills")!;
    });

  }

}
