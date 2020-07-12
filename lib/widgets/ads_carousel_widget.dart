import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:zaha/data/advertisments.dart';
import 'package:zaha/styles/font.dart';

class BuildAdsCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      height:MediaQuery.of(context).size.height/2.4,
      autoPlay: true,
      viewportFraction:0.9,
      autoPlayAnimationDuration: Duration(seconds: 1),
      items: ads.map((ads) {
        return Builder(
          builder: (BuildContext context) {
            Map ad = ads;
            return InkWell(
              onTap: (){
              },
              child: Padding(
                padding: const EdgeInsets.only(right:10.0),
                child:Padding(
              padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
              child: Container(
                width: MediaQuery.of(context).size.width ,
                child: Card(
                  shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(10.0)),
                  elevation: 3.0,
                  child: Column(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Container(
                            height: MediaQuery.of(context).size.height/3.7,
                            width: MediaQuery.of(context).size.width,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              child: Image.asset(
                                "${ad["img"]}",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                        ],
                      ),
                      SizedBox(height: 7.0),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            "${ad["title"]}",
                            style: blackTitle20,
                            //textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      SizedBox(height: 7.0),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            "${ad["description"]}",
                            style: blackDescription12,
                          ),
                        ),
                      ),

                      SizedBox(height: 10.0),

                    ],
                  ),
                ),
              ),
            ),
              ),
            );
          },
        );
      }).toList(),

    );
  }
}
