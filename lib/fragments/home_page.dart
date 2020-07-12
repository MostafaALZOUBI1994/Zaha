import 'package:flutter/material.dart';

typedef void StringCallback(int val);
class Home extends StatelessWidget {
  final StringCallback callback;

  Home({this.callback});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        body:Column(
          children: <Widget>[
            InkWell(
              onTap: (){
                callback(5);
              },
              child: Container(
                color:Colors.red,
                width:200,
                height:100,
                child:Text("container1")
              ),
            ),
            InkWell(
              onTap: (){
               callback(6);
              },

              child: Container(
                  width:300,
                  height:300,
                  color:Colors.green,
                  child:Text("container1")
              ),
            ),
            InkWell(
              onTap: (){

              },

              child: Container(
                  width:100,
                  height:100,
                  color:Colors.blue,
                  child:Text("container1")
              ),
            )
          ],
        )
      )
    );
  }
}
