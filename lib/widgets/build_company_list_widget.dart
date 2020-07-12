import 'package:flutter/material.dart';
import 'package:zaha/data/companies.dart';
import 'package:zaha/data/products.dart';
import 'package:zaha/pages/category_page.dart';
import 'package:zaha/styles/font.dart';

typedef void IndexCallback(int val);
class BuildCompanyList extends StatelessWidget {
  final IndexCallback callback;
  BuildCompanyList({this.callback});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      primary: false,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: products == null ? 0:products.length,
      itemBuilder: (BuildContext context, int index) {
        Map company = companies[index];
        return Padding(
          padding: const EdgeInsets.only(top:10),
          child: InkWell(
            child: Stack(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[

                    Card(
                        shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(10.0)),
                        elevation: 3.0,
                        child: Container(
                            width: MediaQuery.of(context).size.width/1.3,
                            height: MediaQuery.of(context).size.height/8,
                            padding: new EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              children: <Widget>[
                                Container(
                                    width: MediaQuery.of(context).size.width*0.1
                                ),
                                Column(
                                  //mainAxisAlignment: MainAxisAlignment.end,
                                  //crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width/1.6,
                                      child: Text(
                                        "${company["title"]}",
                                        style: blackTitle20,
                                        //textAlign: TextAlign.left,
                                      ),
                                    ),
                                    SizedBox(height: 7.0),
                                    Container(
                                      width: MediaQuery.of(context).size.width/1.6,
                                      child: Text(
                                          "${company["description"]}",
                                          style: blackDescription12
                                      ),
                                    ),
                                    SizedBox(height: 10.0),
                                  ],
                                ),
                              ],
                            )
                        )
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 90,
                          height: 90,
                          child: CircleAvatar(
                            minRadius: 45.0,
                            maxRadius: 45.0,
                            backgroundImage: new AssetImage( company["img"]),
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        );

      },
    );
  }
}
