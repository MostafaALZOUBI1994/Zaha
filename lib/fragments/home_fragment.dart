import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:zaha/data/categories.dart';
import 'package:zaha/data/companies.dart';
import 'package:zaha/localization/app_localization.dart';
import 'package:zaha/styles/color.dart';
import 'package:zaha/styles/font.dart';
import 'package:zaha/widgets/ads_carousel_widget.dart';
import 'package:zaha/widgets/products_carousel_widget.dart';
import 'package:zaha/widgets/search_widget.dart';
typedef void IndexCallback(int val);
class HomeFragment extends StatefulWidget {
  final IndexCallback callback;
  HomeFragment({this.callback});
  @override
  _HomeFragmentState createState() => _HomeFragmentState(callback: this.callback);
}

class _HomeFragmentState extends State<HomeFragment> with AutomaticKeepAliveClientMixin<HomeFragment>{
  final IndexCallback callback;
  _HomeFragmentState({this.callback});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.fromLTRB(10.0,0,10.0,0),
          child: Stack(
            children: <Widget>[
              Positioned(
                top:50,
                bottom:0,
                left:0,right:0,
                child: ListView(
                  children: <Widget>[

                    //Horizontal List here
                    BuildAdsCarousel(),
                    SizedBox(height: 20.0),
                    _buildTitle(AppLocalization.of(context).featuredProduct,9),
                    SizedBox(height: 10.0),
                    //Horizontal List here
                    ProductsCarousel(callback: this.callback),
                    SizedBox(height: 20.0),
                    _buildTitle(AppLocalization.of(context).featuredCompany,59),
                    SizedBox(height: 10.0),
                    _buildCompaniesCarousel(),
                    SizedBox(height: 20.0),
                    BuildAdsCarousel(),
                    SizedBox(height: 20.0),
                    _buildTitle(AppLocalization.of(context).categories,40),
                    SizedBox(height: 10.0),
                    _buildCategoriesCarousel(),
                    SizedBox(height: 20.0),
                  ],
                ),
              ),
              Positioned(top:25,right:0,left:0,child: Search()),
            ],
          )
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
      height: 50,
      autoPlayAnimationDuration: Duration(seconds:4),
      items: companies.map((companies) {
        return Builder(
          builder: (BuildContext context) {

            return Row(
              children: <Widget>[
                InkWell(
                  onTap: (){
                    callback(6);
                  },
                 // onTap: ()=>pageController.jumpToPage(6),

                  child: Padding(
                    padding: EdgeInsets.only(right: 5.0),
                    child: CircleAvatar(
                      backgroundColor: whiteColor,
                      backgroundImage: AssetImage(
                        "companies/vloks.png",
                      ),
                      radius: 25.0,
                    ),
                  ),
                ),
                InkWell(
                 // onTap: ()=>pageController.jumpToPage(6),
                  onTap: (){
                    callback(6);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: 5.0),
                    child: CircleAvatar(

                      backgroundColor: whiteColor,
                      backgroundImage: AssetImage(
                        "companies/nissan.png",

                      ),
                      radius: 25.0,
                    ),
                  ),
                ),
                InkWell(
                  //onTap: ()=>pageController.jumpToPage(6),
                  onTap: (){
                    callback(6);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: 5.0),
                    child: CircleAvatar(
                      backgroundColor: whiteColor,
                      backgroundImage: AssetImage(

                        "companies/mercedes.png",
                      ),
                      radius: 25.0,
                    ),
                  ),
                ),
                InkWell(
                  //onTap: ()=>pageController.jumpToPage(6),
                  onTap: (){
                    callback(6);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: 5.0),
                    child: CircleAvatar(
                      backgroundColor: whiteColor,
                      backgroundImage: AssetImage(
                        "companies/lamborghini.jpg",
                      ),
                      radius: 25.0,
                    ),
                  ),
                ),
                InkWell(
                  //onTap: ()=>pageController.jumpToPage(6),
                  onTap: (){
                    callback(6);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: 5.0),
                    child: CircleAvatar(
                      backgroundColor: whiteColor,
                      backgroundImage: AssetImage(

                        "companies/lexus.png",
                      ),
                      radius: 30.0,
                    ),
                  ),
                ),
                InkWell(
                  //onTap: ()=>pageController.jumpToPage(6),
                  onTap: (){
                    callback(6);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: 5.0),
                    child: CircleAvatar(
                      backgroundColor: whiteColor,
                      backgroundImage: AssetImage(
                        "companies/bmw.jpg",
                      ),
                      radius: 25.0,
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
  Widget _buildCategoriesCarousel() {
    return Container(
      height: MediaQuery.of(context).size.height/6,
      child: ListView.builder(
        primary: false,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: categories == null ? 0:categories.length,
        itemBuilder: (BuildContext context, int index) {
          Map cat = categories[index];
          return InkWell(
            onTap: (){
              callback(7);
            },
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Stack(
                  children: <Widget>[
                    Image.asset(
                      cat["img"],
                      height: MediaQuery.of(context).size.height/6,
                      width: MediaQuery.of(context).size.height/6,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color:blackColor100,
                      ),
                      height: MediaQuery.of(context).size.height/6,
                      width: MediaQuery.of(context).size.height/6,
                    ),
                    Center(

                      child: Container(
                        height: MediaQuery.of(context).size.height/6,
                        width: MediaQuery.of(context).size.height/6,
                        padding: EdgeInsets.all(1),
                        constraints: BoxConstraints(
                          minWidth: 20,
                          minHeight: 20,
                        ),
                        child: Center(
                          child: Text(
                            cat["title"],
                            style: whiteText20,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
