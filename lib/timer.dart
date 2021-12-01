import 'dart:async';

import 'package:flutter/material.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title:'Timer',
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
  var _start=0;
  Timer _timer=Timer.periodic(Duration(days:5), (timer) {});

  startTimer(int i) {

    if(_timer!=null){
      _timer.cancel();
    }
    setState(() {
      _start=i;
    });
    _timer=Timer.periodic(Duration(seconds:2), (timer) {
      setState(() {
        _start<1?_timer.cancel():_start -=1;
      });
    });

  }

  pauseTimer() {
    if(_timer!=null){
      _timer.cancel();
    }
  }

  continueTimer() {
    startTimer(_start);
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:Text("Timer"),),
      body:Center(
        child:Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            Text("$_start",style:TextStyle(fontSize:72),),
            Row(
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
                FlatButton.icon(onPressed: ()=>startTimer(10), icon: Icon(Icons.replay), label: Text('Restart')),
                FlatButton.icon(onPressed: pauseTimer, icon: Icon(Icons.pause), label: Text('Pause')),
                FlatButton.icon(onPressed: continueTimer, icon: Icon(Icons.play_arrow), label: Text('Continue')),

              ],
            )
          ],

        ),
      ),
    );
  }

}
