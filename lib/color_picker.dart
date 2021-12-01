import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: "Color Picker",
      home:MyHomePage(),
      theme:ThemeData(
          primaryColor:Colors.purple,
      ),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const List<Color> _defaultColors = [
    Colors.red,
    Colors.pink,
    Colors.purple,
    Colors.deepPurple,
    Colors.indigo,
    Colors.blue,
    Colors.lightBlue,
    Colors.cyan,
    Colors.teal,
    Colors.green,
    Colors.lightGreen,
    Colors.lime,
    Colors.yellow,
    Colors.amber,
    Colors.orange,
    Colors.deepOrange,
    Colors.brown,
    Colors.grey,
    Colors.blueGrey,
    Colors.black,
  ];
  Color currentColor= Colors.amber;
  void changColor(Color color){
    setState(() {
      currentColor=color;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:Text("Color Picker"),),
      body:Center(
        child:RaisedButton(
          child:Text("Change My Color"),
          color:currentColor,
          onPressed: () {
          showDialog(context: context,
           builder:(BuildContext context){
              return AlertDialog(
                content:Column(
                  mainAxisSize:MainAxisSize.min,
                  children: [
                    SingleChildScrollView(
                      child:BlockPicker(
                        pickerColor:currentColor,
                        onColorChanged:changColor,
                        availableColors: _defaultColors,
                      ),
                    ),
                    RaisedButton(
                      child:Text("Close"),
                      onPressed:(){
                      Navigator.pop(context);
                    }),
                  ],
                ),

              );

            });
          },
        ),
      ),
    );
  }
}
