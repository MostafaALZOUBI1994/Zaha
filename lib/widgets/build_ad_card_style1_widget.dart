import 'package:flutter/material.dart';
import 'package:zaha/data/advertisments.dart';
import 'package:zaha/styles/color.dart';

typedef void IndexCallback(int val);
class BuildAdStyle1 extends StatelessWidget {
  final IndexCallback callback;
  BuildAdStyle1({this.callback});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
          child: Padding(
            padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
            child: Container(
              width: MediaQuery.of(context).size.width ,
              child: Card(
                shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(10.0)),
                elevation: 3.0,
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.width*1.05,
                          width: MediaQuery.of(context).size.width,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            child: Image.asset(
                              "${ads[0]["img"]}",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              // Add one stop for each color. Stops should increase from 0 to 1
                              stops: [0.2, 0.7],
                              colors: listColor
                              // stops: [0.0, 0.1],
                            ),
                          ),
                          height: MediaQuery.of(context).size.width*1.05,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),



      ),
    );

  }
}
