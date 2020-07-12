import 'package:flutter/material.dart';
import 'package:loadmore/loadmore.dart';
import 'package:zaha/widgets/build_ad_card_style1_widget.dart';
import 'package:zaha/widgets/build_ad_card_style2_widget.dart';
import 'package:zaha/widgets/build_company_list_widget.dart';
import 'package:zaha/widgets/build_product_card_widget.dart';
import 'package:zaha/widgets/search_widget.dart';

typedef void IndexCallback(int val);
class SubCategoryPage extends StatefulWidget {
  final IndexCallback callback;

  SubCategoryPage({this.callback});
  @override
  _SubCategoryPageState createState() => _SubCategoryPageState(callback: this.callback);
}

class _SubCategoryPageState extends State<SubCategoryPage> {
  final IndexCallback callback;
  _SubCategoryPageState({this.callback});
  int get count => list.length;
  List<int> list = [];

  void initState() {
    super.initState();
    // list.addAll(List.generate(30, (v) => v));
  }

  void load() {
    print("load");
    setState(() {
      list.addAll(List.generate(5, (v) => v));
      print("data count = ${list.length}");
    });
  }
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
                  whenEmptyLoad: false,
                  delegate: DefaultLoadMoreDelegate(),
                  textBuilder: DefaultLoadMoreTextBuilder.english,
                ),
                onRefresh: _refresh,
              ),
            ),
            Positioned(top:25,right:0,left:0,child: Search()),
          ],

        ),
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

}
