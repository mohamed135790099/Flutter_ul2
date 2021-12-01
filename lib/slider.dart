import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title:"slider",
      home:MyHomPage(),
    );
  }
}

class MyHomPage extends StatefulWidget {

  @override
  _MyHomPageState createState() => _MyHomPageState();
}

class _MyHomPageState extends State<MyHomPage> {
  double _value=0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:Text("slider"),),
      body:Column(
        mainAxisAlignment:MainAxisAlignment.spaceAround,
        children: [
          Transform(
            transform:Matrix4.skew(0.2,0.3),
            //offset:Offset(_value,_value),
            //scale: _value, use transform.scale
           // angle: _value*(pi/180), use transform.rotate
            child: Container(
              child:Center(child: Text("WELCOME EGYPT",style:TextStyle(fontSize:10,color:Colors.white,backgroundColor:Colors.red),)),
              color:Colors.black,
              height:200,
              width:200,
            ),
          ),
          Text("Value:$_value",style:TextStyle(fontSize:30),),
          Slider(
              value: _value,
              onChanged:(double val){
                setState(() {
                  _value=val;
                });
          },
            min:0,
            max:200,
            divisions:20,
            label: "Value",
            activeColor:Colors.red,
            inactiveColor: Colors.green,
          )
        ],
      ),
    );
  }
}
