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
      title: "ListWheelScrollView",
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
  static const listName = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Step",
    "Oct",
    "Nov",
    "Dec",
    "This",
    "Comes",
    "End",
  ];
  List<Color>colorList=List.generate(listName.length, (index) => Colors.primaries[index]);

  @override
  Widget build(BuildContext context) {
    int i=0;
    return Scaffold(
      appBar: AppBar(
        title: Text("ListWheelScrollView"),
      ),
      body: Container(
        width:double.infinity,
        padding:EdgeInsets.all(15),
        child:ListWheelScrollView(
          itemExtent:100.0,
          children: listName.map((String name) {
            return Container(
              decoration:BoxDecoration(
                color:colorList[i++],
                borderRadius:BorderRadius.circular(10),
                border: Border.all(width:3,color:Colors.grey),
              ),
              padding:EdgeInsets.all(10),
              child: Center(child:Text("$name",style:TextStyle(fontWeight:FontWeight.bold,),),),

          );}).toList(),

        ),
      ),
    );
  }
}
