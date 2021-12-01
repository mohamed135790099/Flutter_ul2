import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: "Marquee",
      home: MyHomePage(),

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
      appBar:AppBar(title:Text("Marquee"),),
      body:ListView(
        children: [
          SizedBox(height:10),
          SizedBox(
            height:170,
            child:Card(
              color:Colors.redAccent,
              child:Marquee(
                text:'Wraps platform-specific persistent storage for simple data ',
                style:TextStyle(fontSize:20,color:Colors.white,fontWeight:FontWeight.bold,),
                blankSpace:200,
                scrollAxis:Axis.vertical,
                crossAxisAlignment:CrossAxisAlignment.start,
                //pauseAfterRound:Duration(seconds:5),
                accelerationDuration:Duration(milliseconds:500),
              ),
            ),
          ),
          SizedBox(height:10,),
          SizedBox(
            height:70,
            child:Card(
              color:Colors.deepPurple,
              child:Marquee(
                text:"You can populate SharedPreferences with initial values in your tests by running this code:",
                style:TextStyle(fontSize:25,color:Colors.white,fontWeight:FontWeight.bold,),
                blankSpace:50,
                scrollAxis:Axis.horizontal,
                crossAxisAlignment:CrossAxisAlignment.start,
               // pauseAfterRound:Duration(seconds:5),
                accelerationDuration:Duration(milliseconds:20),

              ),
            ),
          ),

        ],
      ),

    );
  }
}

