import 'dart:html';

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
      title: "Dismissible",
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
  final li = List<String>.generate(20, (index) => "ItemNum${index + 1}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dismissible"),
      ),
      body: ListView.builder(
          itemCount: li.length,
          itemBuilder: (context, index) {
            final item = li[index];
            return Dismissible(
              key: Key(item),
              child: ListTile(
                title: Center(
                  child: Text(item),
                ),
              ),
              onDismissed: (DismissDirection direction) {
                setState(() {
                  li.removeAt(index);
                });
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text(direction == DismissDirection.startToEnd
                        ? "$item remove"
                        : "$item Like"),
                    action: SnackBarAction(
                      onPressed: () {
                        setState(() {
                          li.insert(index, item);
                        });
                      },
                      label: 'undo',
                    ), duration: Duration(seconds: 5),
                  ),
                );
              },
              background:Container(
                alignment:Alignment.centerLeft,
                color:Colors.deepOrange,
                child:Icon(Icons.delete),
              ),
              secondaryBackground:Container(
                alignment:Alignment.centerRight,
                color:Colors.purpleAccent,
                child:Icon(Icons.thumb_up),
              ),
              confirmDismiss:(DismissDirection dir)async{
                if(dir==DismissDirection.startToEnd){
                  final bool res= await showDialog(context: context,builder:(BuildContext ctx) {
                    return AlertDialog(
                      content:Text("Are sure you want to delete $item"),
                      actions: [
                        FlatButton(onPressed: (){Navigator.of(context).pop();}, child: Text("Cancel",style:TextStyle(color:Colors.black),)),
                        FlatButton(onPressed: (){
                          setState(() {
                            li.removeAt(index);
                          });
                          Navigator.of(context).pop();
                          }, child: Text("Delete",style:TextStyle(color:Colors.black),)),

                      ],
                    );

                  }) as bool;
                  return res;
                }
                else{
                  return true;
                }
              },
            );
          }),
    );
  }
}
