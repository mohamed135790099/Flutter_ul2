import 'dart:html';

import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title:"Multi Image Picker",
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
  List<Asset> images = <Asset>[];
  Future loadAssets()async{
    List<Asset> resultList = <Asset>[];
    try{
     resultList= await MultiImagePicker.pickImages(maxImages: 300,selectedAssets:images,enableCamera:true,materialOptions:MaterialOptions(
       actionBarColor: "black",
       selectCircleStrokeColor:"green",
     ));

    }
    catch(e){}

    setState(() {
      images=resultList;
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:Text("Multi Image Picker"),actions: [
        RaisedButton(onPressed:loadAssets, child: Text("Pick Image")),
      ],),
      body:GridView.count(
          crossAxisCount: 38,
         children:List.generate(images.length,(index){

          return AssetThumb(asset: images[index], width: 300, height: 300);
        }),


      ),
    );
  }
}
