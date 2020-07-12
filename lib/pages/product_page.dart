import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:zaha/localization/app_localization.dart';
import 'package:zaha/styles/color.dart';
import 'package:zaha/styles/font.dart';
import 'package:zaha/widgets/product_viewmodel_widget.dart';
import 'package:zaha/widgets/search_widget.dart';

class ProductPage extends StatefulWidget {
  @override
  State createState() => ProductPageState();
}

class ProductPageState extends State<ProductPage> {
  bool displayText;
  bool selectedInfo1;
  bool selectedInfo2;
  bool selectedInfo3;

  @override
  void initState() {
    displayText = true;
    selectedInfo1 = false;
    selectedInfo2 = false;
    selectedInfo3 = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Material(
            child: SafeArea(
                child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      InkWell(
                        child: AnimatedSwitcher(
                            duration: Duration(milliseconds: 200),
                            child: Container(
                              key: ValueKey<int>(ProductViewModel.selected.id),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    colorFilter: ColorFilter.mode(
                                        blackColor.withOpacity(0.5), BlendMode.dstOut),
                                    image:
                                    AssetImage('assets/' + ProductViewModel.selected.image),
                                    fit: BoxFit.cover,
                                  ),
                                  color: whiteColor
                              ),
                              child: Padding(
                                  padding: EdgeInsets.only(
                                      bottom: MediaQuery.of(context).size.height / 5 + 16.0,
                                      left: 16.0,
                                      right:
                                      (MediaQuery.of(context).size.width / 3) - 16.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      AnimatedOpacity(
                                          opacity: displayText ? 1.0 : 0.0,
                                          duration: Duration(milliseconds: 200),
                                          child: Text(ProductViewModel.selected.title,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: blackTitle34
                                          )),
                                      AnimatedOpacity(
                                          opacity: displayText ? 1.0 : 0.0,
                                          duration: Duration(milliseconds: 200),
                                          child: Padding(
                                              padding: EdgeInsets.only(top: 8.0),
                                              child: Text(
                                                  ProductViewModel.selected.description,
                                                  maxLines: 3,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(color: blackColor))))
                                    ],
                                  )),
                            )),
                        onTap: () {
                          if (!displayText) {
                            setState(() {
                              displayText = true;
                              selectedInfo1 = false;
                              selectedInfo2 = false;
                              selectedInfo3 = false;
                            });
                          }
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(left:16.0,right:16.0,bottom: 16.0,top:10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Spacer(),
                            Padding(
                                padding: EdgeInsets.only(bottom: 16.0),
                                child: frostedIconButton(IconButton(
                                  icon: Icon(Icons.restaurant_menu,
                                      color: selectedInfo1
                                          ? accentColor
                                          : white70),
                                  onPressed: () {
                                    setState(() {
                                      if (displayText) {
                                        displayText = false;
                                      }
                                      if (selectedInfo1) {
                                        displayText = true;
                                        selectedInfo1 = false;
                                      } else {
                                        selectedInfo1 = true;
                                        selectedInfo2 = false;
                                        selectedInfo3 = false;
                                      }
                                    });
                                  },
                                ))),
                            frostedIconButton(IconButton(
                              icon: Icon(Icons.list,
                                  color:
                                  selectedInfo2 ? accentColor :white70),
                              onPressed: () {
                                setState(() {
                                  if (displayText) {
                                    displayText = false;
                                  }
                                  if (selectedInfo2) {
                                    displayText = true;
                                    selectedInfo2 = false;
                                  } else {
                                    selectedInfo1 = false;
                                    selectedInfo2 = true;
                                    selectedInfo3 = false;
                                  }
                                });
                              },
                            )),
                            Padding(
                                padding: EdgeInsets.only(top: 16.0),
                                child: frostedIconButton(IconButton(
                                  icon: Icon(Icons.info_outline,
                                      color: selectedInfo3 ? accentColor : white70),
                                  onPressed: () {
                                    setState(() {
                                      if (displayText) {
                                        displayText = false;
                                      }
                                      if (selectedInfo3) {
                                        displayText = true;
                                        selectedInfo3 = false;
                                      } else {
                                        selectedInfo1 = false;
                                        selectedInfo2 = false;
                                        selectedInfo3 = true;
                                      }
                                    });
                                  },
                                ))),
                            Spacer(),
                            Container(
                              height: MediaQuery.of(context).size.height / 4.5,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: ProductViewModel.products.length,
                                itemBuilder: (context, index) {
                                  return similarProductCard(context, index);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(top:10.0,right:10,left:10),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Search(),
                              ]
                          )
                      ),
                      AnimatedSwitcher(
                          duration: Duration(milliseconds: 200),
                          child: selectedInfo1
                              ? listCard(context, 'Information1',
                              ProductViewModel.selected.information1)
                              : Container(height: 0, width: 0)),
                      AnimatedSwitcher(
                          duration: Duration(milliseconds: 200),
                          child: selectedInfo2
                              ? listCard(context, 'Information2',
                              ProductViewModel.selected.information2)
                              : Container(height: 0, width: 0)),
                      AnimatedSwitcher(
                          duration: Duration(milliseconds: 200),
                          child: selectedInfo3
                              ? infoCard(context, 'Information3',
                              ProductViewModel.selected.information3)
                              : Container(height: 0, width: 0)
                      ),
                    ]
                )
            )
        )
    );
  }

  Widget frostedRound(Widget child) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(50.0),
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: child));
  }

  Widget frostedIconButton(Widget child) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(50.0),
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.4),
                    shape: BoxShape.circle),
                child: child)));
  }

  Widget frostedEdged(Widget child) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: child));
  }
//ingredients
  Widget listCard(BuildContext context, String title, List<String> list) {
    return frostedEdged(Container(
        key: ValueKey<String>(title),
        height: MediaQuery.of(context).size.height / 2.1,
        width: MediaQuery.of(context).size.width / 1.5,
        color: whiteColor.withOpacity(0.4) ,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(
                      left: 16.0, right: 16.0, top: 16.0, bottom: 0.0),
                  child: Text(
                    title,
                    style:
                    blackBold16,
                  )),
              Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Divider(color: accentColor)),
              Expanded(
                  child: ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, int index) {
                      return Padding(
                          padding: EdgeInsets.all(16.0), child: Text(list[index],style: TextStyle(color: blackColor),));
                    },
                  ))
            ])));
  }

  Widget listCard2(BuildContext context, String title, List<String> list) {
    return frostedRound(
      Container(
          key: ValueKey<String>(title),
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width / 1.5,

          decoration: BoxDecoration(
            color: accentColor.withOpacity(0.4),
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(
                        left: 16.0, right: 16.0, top: 16.0, bottom: 8.0),
                    child: Text(
                      title,
                      style:blackBold16,
                    )),
                Padding(
                    padding: EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Divider(color: blackColor)),
                Expanded(
                    child: ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (context, int index) {
                        return Padding(
                            padding: EdgeInsets.all(16.0), child: Text(list[index],style: TextStyle(color: blackColor),));
                      },
                    ))
              ])),
    );
  }

  Widget infoCard(BuildContext context, String title, List<String> list) {
    return frostedEdged(Container(
        key: ValueKey<String>(title),
        height: MediaQuery.of(context).size.height / 2.1,
        width: MediaQuery.of(context).size.width / 1.5,
        color:whiteColor.withOpacity(0.4) ,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(
                      left: 16.0, right: 16.0, top: 16.0, bottom: 8.0),
                  child: Text(
                    title,
                    style:primaryBold16,
                  )),
              Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Divider(color: accentColor)),
              Expanded(
                  child: ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, int index) {
                      return Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                              list[index],
                              style:primaryColorText
                          ));
                    },
                  ))
            ])));
  }

  Widget similarProductCard(BuildContext context, int index) {
    return InkWell(
      child: Padding(
        padding: EdgeInsets.only(right: 16.0, top: 32.0),
        child: frostedEdged(Container(
          width: MediaQuery.of(context).size.width / 1.75,
          color:whiteColor.withOpacity(0.4),
          child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              width: MediaQuery.of(context).size.width / 5,
                              height: MediaQuery.of(context).size.width / 5,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage('assets/'+ProductViewModel.products[index].image)))),
                        ])),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                          width:
                          (MediaQuery.of(context).size.width / 3.5),
                          child: Text(ProductViewModel.products[index].title,
                              softWrap: true,
                              style: TextStyle(color:blackColor),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.schedule,
                            color:blackColor,
                            size: 14.0,
                          ),
                          Text(
                            AppLocalization.of(context).data,
                            //ProductViewModel.products[index].text.toString(),
                            style: blackTitle16,
                          ),
                          SizedBox(width:10),
                          Icon(
                            Icons.thumb_up,
                            color: blackColor,
                            size: 14.0,
                          ),
                          Text(
                              AppLocalization.of(context).data,
                              //ProductViewModel.products[index].text.toString(),
                              style: blackTitle16
                          ),
                        ],
                      )
                    ])
              ]),
        ),
        ),
      ),
      onTap: () {
        setState(() {
          ProductViewModel.selected = ProductViewModel.products[index];
        });
      },
    );
  }



}
