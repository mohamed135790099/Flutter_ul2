import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Text Form Field",
      theme: ThemeData(
        primaryColor: Colors.orange,
        primaryTextTheme: TextTheme(
            button: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            headline1: TextStyle(
              color: Colors.lightBlue,
              fontSize: 25,
            )),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

enum AuthMode { SingUP, Login }

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
  final passwordController=TextEditingController();
  AuthMode _authMode = AuthMode.Login;

  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.SingUP;
      });
    } else {
      setState(() {
        _authMode = AuthMode.Login;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text Form Field"),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: "E-mail"),
                  keyboardType: TextInputType.emailAddress,
                  validator: (val) {
                    if (val!.isEmpty || !val.contains('@')) {
                      return "Invaild Email";
                    }
                    return null;
                  },
                  onSaved: (val) {
                    _authData['email'] = val!;
                    print(_authData['email']);
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Password"),
                  obscureText:true,
                  controller:passwordController,
                  validator: (val) {
                    if (val!.isEmpty || val.length<8) {
                      return "Invaild password";
                    }
                    return null;
                  },
                  onSaved: (val) {
                    _authData['password'] = val!;
                    print(_authData['password']);
                  },
                ),
                 if( _authMode== AuthMode.SingUP)
                    TextFormField(
                        enabled: _authMode == AuthMode.SingUP,
                        decoration: InputDecoration(labelText: "Confirm Password"),
                        obscureText:true,
                        validator:_authMode == AuthMode.SingUP?(value) {
                          if (value!=passwordController.text) {
                            return "Passwords do No Match";
                          }return "null";
                        }:null
                    ),

                SizedBox(
                  height: 15,
                ),
                RaisedButton(
                  onPressed: submit,
                  child:
                      Text(_authMode == AuthMode.Login ? 'LOGIN' : 'SING UP'),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 8),
                  color: Theme.of(context).primaryColor,
                  textColor: Theme.of(context).primaryTextTheme.button!.color,
                ),
                FlatButton(
                  onPressed: _switchAuthMode,
                  child: Text(
                      '${_authMode == AuthMode.Login ? 'SING UP' : 'LOGIN'}INSTEAD'),
                    padding:EdgeInsets.symmetric(vertical:30,horizontal:4),
                  materialTapTargetSize:MaterialTapTargetSize.shrinkWrap,
                  textColor:Theme.of(context).primaryColor,

                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void submit() {
    if(!_formKey.currentState!.validate()){
      return;
    }
    _formKey.currentState!.save();
    if(_authData==AuthMode.Login){}else{}
  }
}
