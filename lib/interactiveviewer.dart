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
      title: "Interactive Viewer",
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
      appBar: AppBar(
        title: Text("Interactive Viewer"),
      ),
      body: Container(
        height: 500,
        width: double.infinity,
        child: InteractiveViewer(
          boundaryMargin:EdgeInsets.all(30),
          constrained:false,
          scaleEnabled:true,
          maxScale:4,
          minScale:1,
          child: Image.asset(
            'E:/flutter-p/flutter_ul2_asyn/android/assets/images/191010_nature.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
