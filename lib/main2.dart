import 'package:flutter/material.dart';
import 'package:flutter_ul2_asyn/signup_sharedpreferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences _prefs= await SharedPreferences.getInstance();
 var _email =_prefs.getString("e");
 var _password=_prefs.getString("p");


  runApp( _email!=null&&_password!=null? MyApp(): Sign());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title:'Flutter App',
      home:MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:Text("Main"),),
      body:Center(
        child:Text("Home Page"),
      ),
    );
  }
}
