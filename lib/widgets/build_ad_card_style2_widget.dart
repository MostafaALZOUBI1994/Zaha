import 'package:flutter/material.dart';
import 'package:zaha/data/advertisments.dart';
import 'package:zaha/styles/font.dart';

typedef void IndexCallback(int val);
class BuildAdStyle2 extends StatelessWidget {
  final IndexCallback callback;
  BuildAdStyle2({this.callback});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
            child: Container(
              width: MediaQuery.of(context).size.width ,
              child: Card(
                shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(10.0)),
                elevation: 3.0,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20.0),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          "${ads[0]["title"]}",
                          style: blackTitle20,
                         // textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    SizedBox(height: 7.0),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          " ${ads[0]["description"]} \n ${ads[0]["description"]}",
                          style: blackDescription12
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Stack(
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height/3.7,
                          width: MediaQuery.of(context).size.width,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                            child: Image.asset(
                              "${ads[0]["img"]}",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                      ],
                    ),

                  ],
                ),
              ),
            ),
          ),
          /*
          child: SlideItem3(
            img: ads[0]["img"],
            title: ads[0]["title"],
            description: ads[0]["description"],
          )

           */
      ),
    );
  }
}