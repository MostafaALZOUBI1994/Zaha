import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:zaha/data/companies.dart';
import 'package:zaha/localization/app_localization.dart';
import 'package:zaha/styles/color.dart';
import 'package:zaha/styles/font.dart';
import 'package:zaha/widgets/products_carousel_widget.dart';

typedef void IndexCallback(int val);
class LocationFragment extends StatefulWidget {
  final IndexCallback callback;
  LocationFragment({this.callback});
  @override
  _LocationFragmentState createState() => _LocationFragmentState(callback: this.callback);
}

class _LocationFragmentState extends State<LocationFragment> {
  final IndexCallback callback;
  _LocationFragmentState({this.callback});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height/1.33,
                color: transparentColor,
              ),
              Container(
                  height: MediaQuery.of(context).size.height/1.4,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage("assets/Google.jpg"),fit: BoxFit.fitHeight)
                  ),
                  child:Column(
                    children: <Widget>[
                      _buildAppBar(context)
                    ],
                  )
              ),
              Positioned(
                bottom:0,
                right:0,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: accentColor.withOpacity(0.9),
                      ),
                      child: new IconButton(
                          icon: Icon(Icons.favorite),
                          tooltip: "Add AD",
                          color: whiteColor,
                          onPressed: () {
                          }),
                    ),
                  ],
                ),

              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left:10.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(AppLocalization.of(context).time,
                        style: primaryText23
                    ),
                    SizedBox(width: 5,),
                    Text("(${AppLocalization.of(context).distance})",
                        style: primaryText23
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(AppLocalization.of(context).locationDescription,
                        style: primaryDescription18
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 20,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: _buildTitle(AppLocalization.of(context).similarCompanies, 10),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: EdgeInsets.fromLTRB(10.0,0,10.0,0),
            child: _buildCompaniesCarousel(),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: _buildTitle(AppLocalization.of(context).featuredProduct,9),
          ),
          SizedBox(height: 10.0),
          //Horizontal List here
          Padding(
            padding: EdgeInsets.fromLTRB(10.0,0,10.0,0),
            child: ProductsCarousel(callback: this.callback,),
          ),
          SizedBox(height: 10.0),
        ],
      ),

    );
  }
  Widget _buildAppBar(BuildContext context){
    return PreferredSize(
      child: Padding(
        padding: EdgeInsets.only(top: 0.0, left: 10.0, right: 10.0),
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
                  IconButton(icon: Icon(Icons.location_on),onPressed: null,),
                  Text(AppLocalization.of(context).location)
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
  Widget _buildTitle(String title,int n){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          title,
          style: blackTitle23
        ),
        FlatButton(
          child: Text(
            AppLocalization.of(context).seeAll,
            style: TextStyle(
              color: accentColor,
            ),
          ),
          onPressed: (){
            /*
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context){
                  return page;
                },
              ),
            );
            */
          },
        ),
      ],
    );
  }
  Widget _buildCompaniesCarousel() {
    return CarouselSlider(
      autoPlay: true,
      viewportFraction:1.0,
      height: 100,
      autoPlayAnimationDuration: Duration(milliseconds: 1500),
      items: companies.map((companies) {
        return Builder(
          builder: (BuildContext context) {
            Map cat = companies;
            return Row(
              children: <Widget>[
                InkWell(
                  onTap:()=>callback(6),
                  child: Padding(
                    padding: EdgeInsets.only(right:MediaQuery.of(context).size.width/85),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Stack(
                        children: <Widget>[
                          Image.asset(
                            cat["img"],
                            height: MediaQuery.of(context).size.height/6,
                            width: MediaQuery.of(context).size.width/3.3,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap:()=>callback(6),
                  child: Padding(
                    padding: EdgeInsets.only(right: MediaQuery.of(context).size.width/85),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Stack(
                        children: <Widget>[
                          Image.asset(
                            cat["img"],
                            height: MediaQuery.of(context).size.height/6,
                            width: MediaQuery.of(context).size.width/3.3,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap:()=>callback(6),
                  child: Padding(
                    padding: EdgeInsets.only(right: MediaQuery.of(context).size.width/85),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Stack(
                        children: <Widget>[
                          Image.asset(
                            cat["img"],
                            height: MediaQuery.of(context).size.height/6,
                            width: MediaQuery.of(context).size.width/3.3,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      }).toList(),
    );
  }
}
