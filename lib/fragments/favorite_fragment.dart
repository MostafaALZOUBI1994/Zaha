import 'package:flutter/material.dart';
import 'package:zaha/localization/app_localization.dart';
import 'package:zaha/styles/color.dart';
import 'package:zaha/styles/font.dart';
import 'package:zaha/widgets/ads_carousel_widget.dart';

class FavoriteFragment extends StatefulWidget {
  @override
  _FavoriteFragmentState createState() => _FavoriteFragmentState();
}

class _FavoriteFragmentState extends State<FavoriteFragment> {
  double _heightAds = 0;
  double _heightCompanies = 0;
  bool opened_company=false;
  bool opened_ads=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: ListView(
        children: <Widget>[
          BuildAdsCarousel(),
          SizedBox(height: 10,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: _buildTitle(AppLocalization.of(context).favoriteCompanies,context),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child:Text(AppLocalization.of(context).favoriteCompaniesDescription,
                style: blackDescription12
              )
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: InkWell(
              onTap: () {
                setState(() {
                  if (_heightCompanies == 0) {
                    _heightCompanies = MediaQuery.of(context).size.height/2.2;
                  } else {
                    _heightCompanies = 0;
                  }
                });
              },
              child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    boxShadow: [
                      new BoxShadow(
                          color: shadowColor,
                          blurRadius: 10.0,
                          offset: new Offset(0, 10))
                    ],
                    borderRadius:BorderRadius.all(Radius.circular(10)),

                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Icon(
                              Icons.favorite,
                              color:accentColor
                            ),
                            SizedBox(width: 10,),
                            Text(AppLocalization.of(context).favoriteCompanies),
                          ],
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: primaryColor
                          ),
                          onPressed: (){
                            setState(() {
                              if (_heightCompanies == 0) {
                                _heightCompanies = MediaQuery.of(context).size.height/2.2;
                              } else {
                                _heightCompanies = 0;
                              }
                              opened_company=!opened_company;
                            });
                          },
                        )
                      ],
                    ),
                  )),
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: AnimatedContainer(
              decoration: BoxDecoration(
                  color: whiteColor,
                  boxShadow: [
                    new BoxShadow(
                        color: shadowColor,
                        blurRadius: 10.0,
                        offset: new Offset(0, 10))
                  ],
                  borderRadius: BorderRadius.all( Radius.circular(10))
              ),
              duration: Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
              height: _heightCompanies,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  Container(
                    child: ListTile(
                      leading: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            image: DecorationImage(image: AssetImage("companies/mcdonalds.png"))
                        ),
                      ),
                      title: Text("Mcdonalds",
                        style: blackTitle16
                      ),
                      subtitle: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit,"
                          " Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                        style: blackDescription12
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 60),
                    child: Divider(
                      height: 1,
                      color: primaryColor,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    child: ListTile(
                      leading: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            image: DecorationImage(image: AssetImage("companies/vloks.png"))
                        ),
                      ),
                      title: Text("Vlokswagen",
                        style: blackTitle16
                      ),
                      subtitle: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit,"
                          " Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                        style: blackDescription12
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 60),
                    child: Divider(
                      height: 1,
                      color: primaryColor,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    child: ListTile(
                      leading: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            image: DecorationImage(image: AssetImage("companies/burger.png"))
                        ),
                      ),
                      title: Text("Burger King",
                        style: blackTitle16
                      ),
                      subtitle: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit,"
                          " Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                        style: blackDescription12
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 60),
                    child: Divider(
                      height: 1,
                      color: primaryColor,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    child: ListTile(
                      leading: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            image: DecorationImage(image: AssetImage("companies/kfc.png"))
                        ),
                      ),
                      title: Text("KFC",
                        style: blackTitle16
                      ),
                      subtitle: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit,"
                          " Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                        style: blackDescription12
                      ),
                    ),
                  ),



                ],
              ),
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: _buildTitle(AppLocalization.of(context).favoriteAdvertisement,context),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child:Text(AppLocalization.of(context).favoriteCompaniesDescription,
                style: blackDescription12
              )
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: InkWell(
              onTap: () {
                setState(() {
                  if (_heightAds == 0) {
                    _heightAds = MediaQuery.of(context).size.height/2.2;
                  } else {
                    _heightAds = 0;
                  }
                });
              },
              child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      color: whiteColor,
                      boxShadow: [
                        new BoxShadow(
                            color: shadowColor,
                            blurRadius: 10.0,
                            offset: new Offset(0, 10))
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(10))

                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Icon(
                              Icons.star,
                              color: accentColor
                            ),
                            SizedBox(width: 10,),
                            Text(AppLocalization.of(context).favoriteAdvertisement),
                          ],
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color:primaryColor,
                          ),
                          onPressed: (){
                            setState(() {
                              if (_heightAds == 0) {
                                _heightAds = MediaQuery.of(context).size.height/2.2;
                              } else {
                                _heightAds = 0;
                              }
                            });
                          },
                        )
                      ],
                    ),
                  )),
            ),
          ),
          SizedBox(height:10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: AnimatedContainer(
              decoration: BoxDecoration(
                  color: whiteColor,
                  boxShadow: [
                    new BoxShadow(
                        color: shadowColor,
                        blurRadius: 10.0,
                        offset: new Offset(0, 10))
                  ],
                  borderRadius: BorderRadius.all( Radius.circular(10))
              ),
              duration: Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
              height: _heightAds,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  Container(
                    child: ListTile(
                      enabled: true,
                      leading: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            image: DecorationImage(image: AssetImage("ads/ad10.jpg"),fit: BoxFit.fitWidth)
                        ),
                      ),
                      title: Text("Nutella",
                        style: blackTitle16
                      ),
                      subtitle: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit,"
                          " Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                        style: blackDescription12
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 60),
                    child: Divider(
                      height: 1,
                      color: primaryColor,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    child: ListTile(
                      leading: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            image: DecorationImage(image: AssetImage("ads/ad15.jpg"),fit: BoxFit.fitWidth)
                        ),
                      ),
                      title: Text("Pringles",
                        style: blackTitle16
                      ),
                      subtitle: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit,"
                          " Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                        style: blackDescription12
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 60),
                    child: Divider(
                      height: 1,
                      color:primaryColor,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    child: ListTile(
                      leading: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            image: DecorationImage(image: AssetImage("ads/ad6.jpg"),fit: BoxFit.fitWidth)
                        ),
                      ),
                      title: Text("Kitkat",
                        style: blackTitle16
                      ),
                      subtitle: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit,"
                          " Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                        style: blackDescription12
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 60),
                    child: Divider(
                      height: 1,
                      color: primaryColor,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    child: ListTile(
                      leading: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            image: DecorationImage(image: AssetImage("ads/ad6.jpg"),fit: BoxFit.fitWidth)
                        ),
                      ),
                      title: Text("Snickers",
                        style: blackTitle16
                      ),
                      subtitle: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit,"
                          " Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                        style: blackDescription12
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 30,),
        ],
      ),
    );
  }
  Widget _buildAppBar(BuildContext context){
    return PreferredSize(
      child: Padding(
        padding: EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
        child: Card(
          elevation: 6.0,
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  IconButton(icon: Icon(Icons.favorite_border),onPressed: (){},),
                  Text(AppLocalization.of(context).favorite)
                ],
              )
          ),
        ),
      ),
      preferredSize: Size(
        MediaQuery.of(context).size.width,
        60.0,
      ),
    );
  }
  Widget _buildTitle(String title, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          title,
          style: blackTitle23
        ),
        IconButton(
          icon: Icon(
            Icons.favorite,
            color: accentColor,
          ),
          onPressed: () {
          },
        )
      ],
    );
  }
}
