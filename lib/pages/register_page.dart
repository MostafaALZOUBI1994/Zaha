import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:nepali_date_picker/nepali_date_picker.dart';
import 'package:zaha/localization/app_localization.dart';
import 'package:zaha/styles/font.dart';
import '../try.dart';
import 'login_page.dart';
import 'package:zaha/styles/color.dart';


class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => new _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  NepaliDateTime _selectedDateTime;
  TextEditingController _datecontroller = new TextEditingController();

  var myFormat = DateFormat('d-MM-yyyy');
  var date=DateTime.now();

  int _radioValue1 = -1;
  int correctScore = 0;
  int _radioValue2 = -1;
  int _radioValue3 = -1;
  int _radioValue4 = -1;
  int _radioValue5 = -1;
  void _handleRadioValueChange1(int value) {
    setState(() {
      _radioValue1 = value;

      switch (_radioValue1) {
        case 0:
          correctScore++;
          break;
        case 1:
          break;
        case 2:
          break;
      }
    });
  }
  void _handleRadioValueChange2(int value) {
    setState(() {
      _radioValue2 = value;

      switch (_radioValue2) {
        case 0:
          break;
        case 1:
          correctScore++;
          break;
        case 2:
          break;
      }
    });
  }
  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    setState(() {
      date = picked ?? date;
    });
  }


  Widget horizontalLine() => Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.0),

    child: Container(
      width: ScreenUtil.getInstance().setWidth(120),
      height: 1.0,
      color: black26.withOpacity(.2),
    ),
  );

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    return new Scaffold(
      backgroundColor: whiteColor,
      resizeToAvoidBottomPadding: true,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[

              Padding(
                padding: EdgeInsets.only(top: 70.0),
                child: Image.asset("assets/image_02.png",fit: BoxFit.cover,),
              ),
              Spacer(),
            ],
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 28.0, right: 28.0, top: 30.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        "assets/logo-zaha.png",
                        width: ScreenUtil.getInstance().setWidth(250),
                        height: ScreenUtil.getInstance().setHeight(250),
                      ),

                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  FormCard(),
                  SizedBox(height: ScreenUtil.getInstance().setHeight(40)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      InkWell(
                        child: Container(
                          width: ScreenUtil.getInstance().setWidth(330),
                          height: ScreenUtil.getInstance().setHeight(100),
                          decoration: BoxDecoration(
                              color: accentColor,
                              borderRadius: BorderRadius.circular(6.0),
                              boxShadow: [
                                BoxShadow(
                                    color: shadowButtonColor,
                                    offset: Offset(0.0, 8.0),
                                    blurRadius: 8.0)
                              ]),
                          child: Material(
                            color: transparentColor,
                            child: InkWell(
                              onTap: (){
                                print(MediaQuery.of(context).size.height);
                              },
                              /*
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => MainScreen()),
                                );
                              },
                               */
                              child: Center(
                                child: Text(AppLocalization.of(context).signUp,
                                    style: buttonText
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(45),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        AppLocalization.of(context).haveAnAccount,
                        style: poppinsFamily,
                      ),
                      SizedBox(width:2),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage()),
                          );
                        },
                        child: Text(AppLocalization.of(context).login,
                            style: poppinsAccent),

                      ),

                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  Widget FormCard(){
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height/1.5,
      decoration: BoxDecoration(
          color: whiteColor,
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
            SizedBox(height: 15),
            Text(AppLocalization.of(context).signUp,
                style: poppinsUtil45
            ),
            SizedBox(
              height: 20,
            ),
            Text("First Name",
                style: poppinUtil26),
            TextField(
              decoration: InputDecoration(
                  hintText: "First Name",
                  hintStyle: grey12),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Last Name",
                style: poppinUtil26),
            TextField(
              decoration: InputDecoration(
                  hintText: "Last Name",
                  hintStyle: grey12),
            ),
            SizedBox(
              height: 20,
            ),
            _buildGenderButton(),
            SizedBox(
              height: 20,
            ),
            Text(AppLocalization.of(context).email,
                style: poppinUtil26),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                  hintText: AppLocalization.of(context).email,
                  hintStyle: grey12),
            ),
            SizedBox(
              height: 20,
            ),
            Text(AppLocalization.of(context).password,
                style: poppinUtil26),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                  hintText: AppLocalization.of(context).password,
                  hintStyle: grey12),
            ),
            InkWell(
              onTap: () => _selectDate(context),
              child: IgnorePointer(
                child: TextField(
                  controller: _datecontroller,
                  decoration: InputDecoration(

                    hintText: ('${myFormat.format(date)}'),
                  ),

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildGenderButton () {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text("Gender :",style: poppinUtil26,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Radio(
              value: 0,
              groupValue: _radioValue1,
              onChanged: _handleRadioValueChange1,
            ),
            new Text(
                'Male',
                style: poppinUtil26
            ),
            new Radio(
              value: 1,
              groupValue: _radioValue1,
              onChanged: _handleRadioValueChange1,
            ),
            new Text(
                'Female',
                style: poppinUtil26
            ),
          ],
        )
      ],
    );
  }

}