import 'package:flutter/material.dart';
import 'package:zaha/data/products.dart';
import 'package:zaha/styles/font.dart';
typedef void IndexCallback(int val);
class BuildProductCard extends StatelessWidget {
  final IndexCallback callback;
  BuildProductCard({this.callback});
  @override
  Widget build(BuildContext context) {
    return InkWell(
     // onTap:()=> pageController.jumpToPage(5),
      onTap: (){
        callback(5);
      },
      child: Container(
          height: MediaQuery.of(context).size.height/2.4,
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
                    Stack(
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height/3.7,
                          width: MediaQuery.of(context).size.width,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            child: Image.asset(
                              "${products[0]["img"]}",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                      ],
                    ),
                    SizedBox(height: 7.0),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal:15.0,vertical: 5),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          "${products[0]["title"]}",
                          style: blackTitle20,
                          //textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    SizedBox(height: 7.0),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal:15.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          "${products[0]["description"]}",
                          style: blackDescription12
                        ),
                      ),
                    ),

                    SizedBox(height: 10.0),

                  ],
                ),
              ),
            ),

      ),
      )    );
  }
}
