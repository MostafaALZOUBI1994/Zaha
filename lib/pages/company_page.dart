import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:loadmore/loadmore.dart';
import 'package:zaha/localization/app_localization.dart';
import 'package:zaha/styles/color.dart';
import 'package:zaha/styles/font.dart';
import 'package:zaha/widgets/build_ad_card_style1_widget.dart';
import 'package:zaha/widgets/build_ad_card_style2_widget.dart';
import 'package:zaha/widgets/build_product_card_widget.dart';
import 'package:zaha/widgets/sliver_widget.dart';
import 'package:zaha/widgets/tab_view_widget.dart';

typedef void IndexCallback(int val);
class CompanyPage extends StatefulWidget {
  final IndexCallback callback;

  CompanyPage({this.callback});
  @override
  _CompanyPageState createState() => _CompanyPageState(callback: this.callback);
}

class _CompanyPageState extends State<CompanyPage> {
  final IndexCallback callback;
  _CompanyPageState({this.callback});
  int get count => list.length;
  List<int> list = [];

  void initState() {
    super.initState();
    // list.addAll(List.generate(30, (v) => v));
  }

  Future load() {
    print("load");
    setState(() {
      list.addAll(List.generate(5, (v) => v));
      print("data count = ${list.length}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            pinned: true,
            expandedHeight: MediaQuery.of(context).size.height / 3,
            title: SliverWidget(
              child: Text(
                "Company Name",
                style: TextStyle(color:primaryColor),
              ),
            ),
            leading: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: SliverWidget(child: Image.asset("assets/ad1.png")),
            ),
            backgroundColor: whiteColor,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                height: 280.0,
                child: new Stack(
                  children: <Widget>[
                    new ClipPath(
                      clipper: new ArcClipper(),
                      child: new Container(
                        height: double.infinity,
                        decoration: new BoxDecoration(
                            gradient: LinearGradient(
                          colors: companyClipper,
                          tileMode: TileMode.clamp,
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          stops: [0.0, 1.0],
                        )),
                      ),
                    ),
                    new Align(
                      alignment: FractionalOffset.center,
                      heightFactor: 3.5,
                      child: Container(
                        margin: new EdgeInsets.only(top: MediaQuery.of(context).size.height/27.23),
                        child: new Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              new Image(
                                width: MediaQuery.of(context).size.width/2.8,
                                height: MediaQuery.of(context).size.height/5.83,
                                image: new AssetImage("assets/ad1.png"),
                              ),
                              new Padding(
                                padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height/27.23),
                                child: new Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    new Container(
                                      width: MediaQuery.of(context).size.width/5.6,
                                      height: MediaQuery.of(context).size.height/27.23,
                                      decoration: new BoxDecoration(
                                        color: transparentColor,
                                      ),
                                      child: new Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Expanded(
                                            child: SizedBox(),
                                          )
                                        ],
                                      ),
                                    ),
                                    new Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          new Text('Company Name',
                                              style: whiteTitle),
                                          new Padding(
                                            padding: const EdgeInsets.only(
                                                left: 28.0, top: 12.0),
                                            child: new Text(AppLocalization.of(context).description,
                                                style: new TextStyle(
                                                  color: whiteColor
                                                      .withOpacity(.3),
                                                )),
                                          ),
                                        ]),
                                    new Container(
                                      width: 60.0,
                                      height: 60.0,
                                      decoration: new BoxDecoration(
                                          color:
                                            accentColor,
                                          shape: BoxShape.circle,
                                         ),
                                      child: new Icon(
                                        Icons.share,
                                        size: 25.0,
                                        color: whiteColor,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ]),
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        SizedBox(
                          height: 30,
                        ),
                        new IconButton(
                          onPressed: () {},
                          icon: new Icon(
                            Icons.arrow_back,
                            color: whiteColor,
                          ),
                          splashColor: blackColor,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Container(
                color: whiteColor,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20),
                    TabViewSegment(),
                    _buildAdAndProductAndCompany(),
                  ],
                ),
              ),
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAdAndProductAndCompany() {
    return Padding(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: Container(
           child: RefreshIndicator(
        child: LoadMore(
        isFinish: count >= 60,
          onLoadMore: _loadMore,
          child:ListView.builder(
            primary: false,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: count+1,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: <Widget>[

                  BuildProductCard(callback: this.callback),
                  SizedBox(height: 20),
                  BuildAdStyle1(callback: this.callback),
                  SizedBox(
                    height: 10,
                  ),
                  BuildProductCard(callback: this.callback),
                  SizedBox(height: 20),
                  BuildAdStyle2(callback: this.callback),
                  SizedBox(height: 20),
                ],
              );
            },
          ),
          whenEmptyLoad: false,
          delegate: DefaultLoadMoreDelegate(),
          textBuilder: DefaultLoadMoreTextBuilder.english,
        ),
      onRefresh: _refresh,
    ),
        ));
  }
  Future<bool> _loadMore() async {
    print("onLoadMore");
    await Future.delayed(Duration(seconds: 0, milliseconds: 2000));
    load();
    return true;
  }

  Future<void> _refresh() async {
    await Future.delayed(Duration(seconds: 0, milliseconds: 2000));
    list.clear();
    load();
  }
}

class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height / 2 + 30);

    var firstControlPoint = new Offset(size.width / 5, size.height);
    var firstPoint = new Offset(size.width / 2, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstPoint.dx, firstPoint.dy);
    var secondControlPoint =
        new Offset(size.width - (size.width / 5), size.height);
    var secondPoint = new Offset(size.width, size.height / 2 + 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondPoint.dx, secondPoint.dy);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}



