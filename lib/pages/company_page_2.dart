import 'package:flutter/material.dart';
import 'package:loadmore/loadmore.dart';
import 'package:zaha/data/categories.dart';
import 'package:zaha/styles/color.dart';
import 'package:zaha/styles/font.dart';
import 'package:zaha/widgets/ads_carousel_widget.dart';
import 'package:zaha/widgets/build_ad_card_style1_widget.dart';
import 'package:zaha/widgets/build_ad_card_style2_widget.dart';
import 'package:zaha/widgets/build_company_list_widget.dart';
import 'package:zaha/widgets/build_product_card_widget.dart';

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
  int get count => list.length;
  List<Widget> list = [];

  void initState() {
    super.initState();
    // list.addAll(List.generate(30, (v) => v));
  }

  void load() {
    print("load");
    setState(() {
      list.addAll(List.generate(20, (v) => Column(
        children: <Widget>[
          BuildProductCard(callback: this.callback),
          SizedBox(height:20),
          BuildCompanyList(callback:this.callback),
          SizedBox(height:20),
          BuildAdStyle1(),
          SizedBox(height: 10,),
          BuildProductCard(callback: this.callback),
          SizedBox(height:20),
          BuildAdStyle2(),
          SizedBox(height:20),
          BuildCompanyList(callback: this.callback),
          SizedBox(height:20),
        ],
      )));
      print("data count = ${list.length}");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body:  RefreshIndicator(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  BuildAdsCarousel(),
                  SizedBox(height: 20.0),
                  _buildTitle("Sub Catregories", 40, true, categories),
                  _buildSubCategoriesList(),
                  SizedBox(height: 20),
                ],
              ),
              _buildListOfAdsAndCompanies()
            ],
          ),
        ),
        onRefresh: _refresh,
      ),
    );
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

  Widget _buildListOfAdsAndCompanies(){
    return LoadMore(
      isFinish: count >= 60,
      onLoadMore: _loadMore,
      child: Column(
        children: <Widget>[
          ListView.builder(
            primary: false,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: ScrollPhysics(),
            itemCount: count+1,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: <Widget>[
                  BuildProductCard(callback: this.callback),
                  SizedBox(height:20),
                  BuildCompanyList(callback:this.callback),
                  SizedBox(height:20),
                  BuildAdStyle1(),
                  SizedBox(height: 10,),
                  BuildProductCard(callback: this.callback),
                  SizedBox(height:20),
                  BuildAdStyle2(),
                  SizedBox(height:20),
                  BuildCompanyList(callback: this.callback),
                  SizedBox(height:20),
                ],
              );
            },

          ),
        ],
      ),
      whenEmptyLoad: false,
      delegate: DefaultLoadMoreDelegate(),
      textBuilder: DefaultLoadMoreTextBuilder.english,
    );
  }
  Widget _buildAppBar() {
    return PreferredSize(
      child: Padding(
        padding: EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
        child: Card(
          elevation: 6.0,
          child: Container(
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.all(
                Radius.circular(5.0),
              ),
            ),
            child: TextField(
              style: blackTitle16,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: whiteColor,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: whiteColor,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  hintText: "Search..",
                  prefixIcon: Icon(
                    Icons.search,
                    color: blackColor,
                  ),
                  suffixIcon: IconButton(
                      icon: Icon(Icons.filter_list),
                      color: primaryColor,
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  hintStyle: blackTitle16
              ),
              maxLines: 1,
              controller: _searchControl,
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
            "See all ($n)",
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
                  /*
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SubCategoryPage()),
                  );
                   */
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

                      /*
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        // Add one stop for each color. Stops should increase from 0 to 1
                        stops: [0.2, 0.7],
                        colors: [
                          Theme.of(context).primaryColor,
                          Theme.of(context).primaryColor
                        ],
                        // stops: [0.0, 0.1],
                      ),
                    ),
                    height: MediaQuery.of(context).size.height/6,
                    width: MediaQuery.of(context).size.height/6,
                  ),
                  */
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


}