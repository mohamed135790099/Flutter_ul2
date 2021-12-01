import 'package:flutter/material.dart';
import 'package:flutter_ul2_asyn/main2.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sign extends StatefulWidget {
  const Sign({Key? key}) : super(key: key);

  @override
  _SignState createState() => _SignState();
}

class _SignState extends State<Sign> {

  final _emailController=TextEditingController();
  final _passwordController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title:'SignUp',
      home:Scaffold(
        appBar:AppBar(title:Text("SignUp"),),
        body:Container(
          padding:EdgeInsets.all(50),
          child:Column(
            children: [
              TextField(
                decoration:InputDecoration(hintText:"Email"),
                controller:_emailController,
              ),
              TextField(
                decoration:InputDecoration(hintText:"Password"),
                controller:_passwordController,
              ),
              SizedBox(height:15,),
              Builder(builder: (context){
                return  RaisedButton(
                    child:Text("Sign Up") ,
                    onPressed: () async {
                      SharedPreferences _prefs= await SharedPreferences.getInstance();
                      _prefs.setString("e", "_emailController.text");
                      _prefs.setString("p", "_passwordController.text");

                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>MyApp()));
                    }

                );
              })

            ],
          ),
        ),
      ),
    );
  }
}
