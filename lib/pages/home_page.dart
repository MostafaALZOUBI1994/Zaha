import 'package:flutter/material.dart';
import 'package:zaha/fragments/favorite_fragment.dart';
import 'package:zaha/fragments/home_fragment.dart';
import 'package:zaha/fragments/information_fragment.dart';
import 'package:zaha/fragments/location_fragment.dart';
import 'package:zaha/fragments/profile_fragment.dart';
import 'package:zaha/pages/category_page.dart';
import 'package:zaha/pages/company_page.dart';
import 'package:zaha/pages/product_page.dart';
import 'package:zaha/pages/subcategory_page.dart';
import 'package:zaha/styles/color.dart';


class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int index = 0;
  set Integer(int value) => setState(() => index = value);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            new Offstage(
              offstage: index != 0,
              child: new TickerMode(
                enabled: index == 0,
                child: HomeFragment(callback: (val) => setState(() => index = val)),
              ),
            ),
            new Offstage(
              offstage: index != 1,
              child: new TickerMode(
                enabled: index == 1,
                child: FavoriteFragment(),
              ),
            ),
            new Offstage(
              offstage: index != 2,
              child: new TickerMode(
                enabled: index == 2,
                child: FavoriteFragment(),
              ),
            ),
            new Offstage(
              offstage: index != 3,
              child: new TickerMode(
                enabled: index == 3,
                child: LocationFragment(callback: (val) => setState(() => index = val)),
              ),
            ),
            new Offstage(
              offstage: index != 4,
              child: new TickerMode(
                enabled: index == 4,
                child: ProfileFragment(),
              ),
            ),
            new Offstage(
              offstage: index != 5,
              child: new TickerMode(
                enabled: index == 5,
                child: ProductPage(),
              ),
            ),
            new Offstage(
              offstage: index != 6,
              child: new TickerMode(
                enabled: index == 6,
                child: CompanyPage(callback: (val) => setState(() => index = val)),
              ),
            ),
            new Offstage(
              offstage: index != 7,
              child: new TickerMode(
                enabled: index == 7,
                child: CategoryPage(callback: (val) => setState(() => index = val)),
              ),
            ),
            new Offstage(
              offstage: index != 8,
              child: new TickerMode(
                enabled: index == 8,
                child: SubCategoryPage(callback: (val) => setState(() => index = val)),
              ),
            ),
          ],
        ),

        bottomNavigationBar: BottomAppBar(
          child: new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(width:7),
              IconButton(
                icon: Icon(
                  Icons.home,
                  size: 24.0,

                ),
                color: index == 0
                    ? accentColor
                    : whiteColor,
                onPressed: (){
                  setState(() {
                    this.index = 0;
                  });
                }
              ),

              IconButton(
                icon:Icon(
                  Icons.favorite,
                  size: 24.0,
                ),
                color: index == 1
                    ? accentColor
                    : whiteColor,
                  onPressed: (){
                    setState(() {
                      this.index = 1;
                    });
                  }
              ),

              IconButton(
                icon: Icon(
                  Icons.add,
                  size: 24.0,
                  color: transparentColor,
                ),
                color: index == 2
                    ? accentColor
                    : whiteColor,
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.location_on,
                  size: 24.0,
                ),
                color: index == 3
                    ? accentColor
                    : whiteColor,
                  onPressed: (){
                    setState(() {
                      this.index = 3;
                    });
                  }
              ),
              IconButton(
                icon: Icon(
                  Icons.person,
                  size: 24.0,
                ),
                color: index == 4
                    ? accentColor
                    : whiteColor,
                  onPressed: (){
                    setState(() {
                      this.index = 4;
                    });
                  }
              ),

              SizedBox(width:7),
            ],
          ),
          color: primaryColor,
          shape: CircularNotchedRectangle(),

        ),

        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
            elevation: 10.0,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Image.asset("assets/Z.png"),
            ),
            onPressed: () {
              print(MediaQuery.of(context).size.width);
              showDialog(
                barrierDismissible: true,
                context: context,
                builder: (_) =>InformationFragment(),
              );
            }

        )
    );
  }



  @override
  void initState() {
    super.initState();
  }

}
