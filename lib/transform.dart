import 'dart:math';

import 'package:flutter/material.dart';
void main(){
  runApp(MyHomePage());
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _value=0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:"TransForm",
      debugShowCheckedModeBanner:false,
      home:Scaffold(
        appBar:AppBar(title:Text("TransForm"),),
        body:Center(
          child:Column(
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
              Container(
                transform: Matrix4.rotationZ(270*(pi/180))..translate(_value,-_value,_value),
                width:300,
                padding:EdgeInsets.symmetric(vertical:8,horizontal:8),
                decoration: BoxDecoration(
                    borderRadius:BorderRadius.circular(20) ,
                    color:Colors.deepOrange.shade900 ,
                    boxShadow: [
                      BoxShadow(
                        blurRadius:8,
                        color:Colors.black26,
                        offset: Offset(0,2),
                      ),
                    ],
                ),
                child:Text(
                  "MySHOP",
                  textAlign:TextAlign.center,
                  style:TextStyle(
                    color: Colors.white,
                    fontSize:30,
                    fontWeight:FontWeight.bold,
                  ),
                ),
              ),
          Text("V=$_value",style:TextStyle(fontSize:30,fontWeight:FontWeight.bold),),
          Slider(value:_value, onChanged:(val){setState(() {_value=val;});},min:0,max:360

          )


            ],
          )
        ),
      )
    );
  }
}
