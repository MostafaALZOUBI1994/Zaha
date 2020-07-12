import 'package:flutter/material.dart';
import 'package:zaha/data/categories.dart';
import 'package:zaha/localization/app_localization.dart';
import 'package:zaha/styles/color.dart';
import 'package:zaha/styles/font.dart';
import 'package:zaha/widgets/ads_carousel_widget.dart';
import 'package:zaha/widgets/build_ad_card_style1_widget.dart';
import 'package:zaha/widgets/build_ad_card_style2_widget.dart';
import 'package:zaha/widgets/build_company_list_widget.dart';
import 'package:zaha/widgets/build_product_card_widget.dart';
import 'package:zaha/widgets/search_widget.dart';

typedef void IndexCallback(int val);
class CategoryPage extends StatefulWidget {
  final IndexCallback callback;

  CategoryPage({this.callback});
  @override
  _CategoryPageState createState() => _CategoryPageState(callback: this.callback);
}

class _CategoryPageState extends State<CategoryPage> {
  final IndexCallback callback;
  _CategoryPageState({this.callback});
  final TextEditingController _searchControl = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: Stack(
          children: <Widget>[
            Positioned(
              top:50,
              bottom:0,
              left:0,right:0,
              child: ListView(
                children: <Widget>[
                  BuildAdsCarousel(),
                  SizedBox(height: 20.0),
                  _buildTitle(AppLocalization.of(context).subCategories, 40, true, categories),
                  _buildSubCategoriesList(),
                  SizedBox(height: 20),
                  _buildAdAndProductAndCompany()
                ],
              ),
            ),
            Positioned(top:25,right:0,left:0,child: Search()),

          ],
        ),
      ),
    );
  }

  Widget _buildTitle(String title, int n, bool isN, List lista) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          title,
          style: blackTitle23
        ),
        isN
            ? FlatButton(
                child: Text(
                  AppLocalization.of(context).seeAll,
                  style: TextStyle(
                    color: accentColor,
                  ),
                ),
                onPressed: () {
                },
              )
            : Container(),
      ],
    );
  }

  Widget _buildSubCategoriesList() {
    return Container(
      height: MediaQuery.of(context).size.height / 6,
      child: ListView.builder(
        primary: false,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: categories == null ? 0 : categories.length,
        itemBuilder: (BuildContext context, int index) {
          Map category = categories[index];
          return Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: InkWell(
                onTap: () {
                  callback(8);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Stack(
                    children: <Widget>[
                      Image.asset(
                        category["img"],
                        height: MediaQuery.of(context).size.height / 6,
                        width: MediaQuery.of(context).size.height / 6,
                        fit: BoxFit.cover,
                      ),
                      Center(
                        child: Container(
                          height: MediaQuery.of(context).size.height / 6,
                          width: MediaQuery.of(context).size.height / 6,
                          padding: EdgeInsets.all(1),
                          constraints: BoxConstraints(
                            minWidth: 20,
                            minHeight: 20,
                          ),
                          child: Center(
                            child: Text(
                              category["title"],
                              style: whiteText20,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }

  Widget _buildAdAndProductAndCompany() {
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: 6,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: <Widget>[
            BuildProductCard(callback: this.callback),
            SizedBox(height: 20),
             BuildCompanyList(callback: this.callback,),
            SizedBox(height: 20),
            BuildAdStyle1(),
            SizedBox(
              height: 10,
            ),
            BuildProductCard(callback: this.callback,),
            SizedBox(height: 20),
            BuildAdStyle2(),
            SizedBox(height: 20),
            BuildCompanyList(callback: this.callback,),
            SizedBox(height: 20),
          ],
        );
      },
    );
  }
}
