import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'color.dart';


var whiteTitle=TextStyle(
    color: whiteColor,
    fontSize: 20.0,
    fontFamily: "OpenSans",
    fontWeight: FontWeight.w300,
    fontStyle: FontStyle.normal);

var buttonText=TextStyle(
    color: whiteColor,
    fontFamily: "Poppins-Bold",
    fontSize: 18,
    letterSpacing: 1.0);

var blackTitle16= TextStyle(
    fontSize: 16.0,
    fontFamily: "Poppins-Medium"
);
var blackBold16 = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    color: Colors.black
);

var blackTitle34 = TextStyle(
    fontSize: 34.0,
    color: Colors.black
);

var blackTitle23 = TextStyle(
  fontSize: 23,
  fontWeight: FontWeight.w800,
);

var blackTitle20 = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w800,
);
var blackDescription12 = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w300,
);

var whiteText20 = TextStyle(
  color: Colors.white,
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

var primaryText23 =TextStyle(
    fontSize: 23,
    color: primaryColor
);

var primaryDescription18 = TextStyle(
    fontSize: 18,
    color: primaryColor.withOpacity(0.7)
);

var primaryColorBoldText = TextStyle(
    color:primaryColor,
    fontWeight: FontWeight.bold
);

var primaryColorText = TextStyle(
    color:primaryColor,
);

var primaryBold16 = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    color:Color.fromRGBO(72, 72, 72,1.0)
);

var poppinsFamily = TextStyle(
    fontFamily: "Poppins-Medium"
);

var poppinsAccent = TextStyle(
    color:accentColor,
    fontFamily: "Poppins-Bold");

var poppinsUtil45 =TextStyle(
fontSize: ScreenUtil.getInstance().setSp(45),
fontFamily: "Poppins-Bold",
letterSpacing: .6);

var poppinUtil26 = TextStyle(
    fontFamily: "Poppins-Medium",
    fontSize: ScreenUtil.getInstance().setSp(26));

var grey12 = TextStyle(color: Colors.grey, fontSize: 12.0);

var poppinWhite18 = TextStyle(
    color: Colors.white,
    fontFamily: "Poppins-Bold",
    fontSize: 18,
    letterSpacing: 1.0);

var poppinAccent28 = TextStyle(
    color: accentColor,
    fontFamily: "Poppins-Medium",
    fontSize: ScreenUtil.getInstance().setSp(28));