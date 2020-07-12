import 'package:flutter/material.dart';
import 'package:zaha/localization/app_localization.dart';
import 'package:zaha/styles/color.dart';
import 'package:zaha/styles/font.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  // Define the various properties with default values. Update these properties
  // when the user taps a FloatingActionButton.

  final TextEditingController _searchControl = new TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  double _height = 0;
  double _heightCategoies = 0;

  @override
  Widget build(BuildContext context) {
    return  PreferredSize(
      child: Padding(
        padding: EdgeInsets.only(top: 5.0, left: 0.0, right: 0.0),
        child: Card(
          elevation: 6.0,
          child: Container(
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.all(
                Radius.circular(5.0),
              ),
            ),
            child: Column(
              children: <Widget>[
                TextField(
                  style: blackTitle16,
                  decoration: InputDecoration(
                    fillColor: whiteColor,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(10.0),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:whiteColor)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: whiteColor,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    hintText: AppLocalization.of(context).search,
                    prefixIcon: Icon(
                      Icons.search,
                      color: primaryColor,
                    ),
                    suffixIcon: IconButton(
                        icon: Icon(Icons.filter_list),
                        color: primaryColor,
                        onPressed: () {
                          setState(() {
                            if (_height == 0) {
                              _height = 200;
                              _heightCategoies=0;
                            } else {
                              _height = 0;
                            }
                          });
                        }),
                    hintStyle: blackTitle16
                  ),
                  maxLines: 1,
                  controller: _searchControl,
                ),
                AnimatedContainer(
                  height: _height,
                  child: ListView(
                    children: <Widget>[
                      TextField(
                          decoration: new InputDecoration(
                              border:InputBorder.none,
                              hintText: AppLocalization.of(context).companies,
                              contentPadding: const EdgeInsets.all(20.0)
                          )
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            FlatButton(
                              child: Text(AppLocalization.of(context).categories,
                                style:blackTitle16,
                              ),
                              onPressed: (){},
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.arrow_drop_down,
                              ),
                              onPressed: () {
                                setState(() {
                                  if (_heightCategoies == 0) {
                                    _heightCategoies = 200;
                                    _height = MediaQuery.of(context).size.height/2.149;
                                  } else {
                                    _heightCategoies = 0;
                                    _height = 200;
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      AnimatedContainer(
                        height: _heightCategoies,
                        child: ListView(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left:30.0),
                              child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.directions_transit,
                                            color: accentColor,
                                          ),
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          Text(AppLocalization.of(context).category),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: <Widget>[
                                          Icon(Icons.directions_transit,
                                              color: accentColor),
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          Text(AppLocalization.of(context).category),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: <Widget>[
                                          Icon(Icons.directions_transit,
                                              color:accentColor),
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          Text(AppLocalization.of(context).category),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: <Widget>[
                                          Icon(Icons.directions_transit,
                                              color:accentColor),
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          Text(AppLocalization.of(context).category),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: <Widget>[
                                          Icon(Icons.directions_transit,
                                              color:accentColor),
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          Text(AppLocalization.of(context).category),
                                        ],
                                      ),
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                        duration: Duration(seconds: 1),
                        curve: Curves.fastOutSlowIn,
                      ),
                      TextField(
                          decoration: new InputDecoration(
                              border:InputBorder.none,
                              hintText: AppLocalization.of(context).products,
                              contentPadding: const EdgeInsets.all(20.0)
                          )),
                    ],
                  ),
                  duration: Duration(seconds: 1),
                  curve: Curves.fastOutSlowIn,
                )
              ],
            ),
          ),
        ),
      ),
      preferredSize: Size(
        MediaQuery.of(context).size.width,
        60.0,
      ),
    );
  }
}
