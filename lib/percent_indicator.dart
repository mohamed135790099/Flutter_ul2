import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "percent indicator",
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
  double _value=0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Percent Indicator"),
      ),
      body:Center(
        child: Column(
          children: [
            CircularPercentIndicator(
              radius: 100,
              percent:_value,
              lineWidth:9,
              header:Text("Icon header"),
              center:Icon(
                Icons.person_pin,
                size:50.5,
                color:Colors.blue,
              ),
              backgroundColor:Colors.grey,
              progressColor:Colors.blue,

            ),
            Slider(value:_value,onChanged:(val){setState(() {_value=val;});},
              min:0.0,
              max:1.0,
              divisions:10,
            ),
          ],
        ),
      ),




      /*ListView(
        children: [
          CircularPercentIndicator(
            radius: 100,
            percent:0.97,
            lineWidth:9,
            header:Text("Icon header"),
            center:Icon(
              Icons.person_pin,
              size:50.5,
              color:Colors.blue,
            ),
            backgroundColor:Colors.grey,
            progressColor:Colors.blue,

          ),
          SizedBox(height:20,),
          CircularPercentIndicator(
            radius: 300,
            percent:0.97,
            lineWidth:15,
            animation:true,
            animationDuration:1200,
            header:Text("Icon header"),
            center:Text("60 Hours",style:TextStyle(fontWeight:FontWeight.bold,fontSize:30),),
            backgroundColor:Colors.yellow,
            progressColor:Colors.red,

          ),
          SizedBox(height:20,),
          LinearPercentIndicator(
            lineHeight:14,
            width:180,
            percent:0.7,
            center:Text("50.5%",style:TextStyle(fontSize:14),),
            linearStrokeCap:LinearStrokeCap.roundAll,
            trailing:Icon(Icons.mood),
            backgroundColor:Colors.yellow,
            progressColor:Colors.red,

          ),
          LinearPercentIndicator(
            lineHeight:20,
            width:170,
            percent:0.97,
            animation:true,
            animationDuration:1200,
            center:Text("90.5%",style:TextStyle(fontSize:20),),
            linearStrokeCap:LinearStrokeCap.butt,
            trailing:Text("left content"),
            leading:Text("right content"),
            backgroundColor:Colors.grey,
            progressColor:Colors.amber,

          ),


        ],
      ),
      */
    );
  }
}
