import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:zaha/data/products.dart';
import 'package:zaha/pages/product_page.dart';
import 'package:zaha/styles/color.dart';
import 'package:zaha/styles/font.dart';
typedef void IndexCallback(int val);
class ProductsCarousel extends StatelessWidget {
  final IndexCallback callback;
  ProductsCarousel({this.callback});
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      autoPlay: true,
      viewportFraction:1.0,
      height: 100,
      autoPlayAnimationDuration: Duration(milliseconds: 1500),
      items: products.map((products) {
        return Builder(
          builder: (BuildContext context) {
            Map cat = products;
            return Row(
              children: <Widget>[
                InkWell(
                  onTap: (){
                    callback(5);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: MediaQuery.of(context).size.width/85),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Stack(
                        children: <Widget>[
                          Image.asset(
                            "products/pro8.jpg",
                            height: MediaQuery.of(context).size.height/6,
                            width: MediaQuery.of(context).size.width/3.3,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color:blackColor100,
                            ),
                            height: MediaQuery.of(context).size.height/6,
                            width: MediaQuery.of(context).size.width/3.3,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height/6,
                            width: MediaQuery.of(context).size.width/3.3,
                            padding: EdgeInsets.all(1),
                            constraints: BoxConstraints(
                              minWidth: 20,
                              minHeight: 20,
                            ),
                            child: Center(
                              child: Text(
                                "Dior",
                                style: whiteText20,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )

                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    callback(5);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right:MediaQuery.of(context).size.width/85),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Stack(
                        children: <Widget>[
                          Image.asset(
                            "products/pro10.jpg",
                            height: MediaQuery.of(context).size.height/6,
                            width: MediaQuery.of(context).size.width/3.3,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color:blackColor100
                            ),
                            height: MediaQuery.of(context).size.height/6,
                            width: MediaQuery.of(context).size.width/3.3,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height/6,
                            width: MediaQuery.of(context).size.width/3.3,
                            padding: EdgeInsets.all(1),
                            constraints: BoxConstraints(
                              minWidth: 20,
                              minHeight: 20,
                            ),
                            child: Center(
                              child: Text(
                                "Milka",
                                style: whiteText20,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )

                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    callback(5);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: MediaQuery.of(context).size.width/85),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Stack(
                        children: <Widget>[
                          Image.asset(
                            "products/pro12.jpg",
                            height: MediaQuery.of(context).size.height/6,
                            width: MediaQuery.of(context).size.width/3.3,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color:blackColor100,
                            ),
                            height: MediaQuery.of(context).size.height/6,
                            width: MediaQuery.of(context).size.width/3.3,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height/6,
                            width: MediaQuery.of(context).size.width/3.3,
                            padding: EdgeInsets.all(1),
                            constraints: BoxConstraints(
                              minWidth: 20,
                              minHeight: 20,
                            ),
                            child: Center(
                              child: Text(
                                "Canon",
                                style: whiteText20,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )

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
