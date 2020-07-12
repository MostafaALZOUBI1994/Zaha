import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaha/localization/app_localization.dart';
import 'package:zaha/pages/resetpassword_page.dart';
import 'package:zaha/styles/color.dart';
import 'package:zaha/styles/font.dart';
class FormCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height/2.5,
      decoration: BoxDecoration(
          color:whiteColor,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
                color: black12,
                offset: Offset(0.0, 15.0),
                blurRadius: 15.0),
            BoxShadow(
                color: black12,
                offset: Offset(0.0, -10.0),
                blurRadius: 10.0),
          ]),
      child: Padding(
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 10,),
            Text(AppLocalization.of(context).login,
                //"Login",
                style: poppinsUtil45),
            SizedBox(
              height: 10,
            ),
            Text(AppLocalization.of(context).userName,
                //"Username",
                style: poppinUtil26),
            TextField(
              decoration: InputDecoration(
                  hintText: AppLocalization.of(context).userName,
                  //"username",
                  hintStyle: grey12),
            ),
            SizedBox(
              height: 20,
            ),
            Text(AppLocalization.of(context).password,
                //"PassWord",
                style: poppinUtil26),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                  hintText: AppLocalization.of(context).password,
                  //"PassWord",
                  hintStyle: grey12),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                InkWell(
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context){
                          return ResetPasswordPage();
                        },
                      ),
                    );
                  },
                  child: Text(AppLocalization.of(context).forgotPassword,
                    //"Forgot Password?",
                    style: poppinAccent28,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}