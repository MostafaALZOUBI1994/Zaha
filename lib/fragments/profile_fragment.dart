import 'package:flutter/material.dart';
import 'package:zaha/localization/app_localization.dart';
import 'package:zaha/styles/color.dart';
import 'package:zaha/styles/font.dart';

class ProfileFragment extends StatelessWidget {
  bool val;
  ProfileFragment();
  double _imageHeight = 230.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          backgroundBlendMode: BlendMode.srcOver,
          color: whiteColor,
        ),
        width: double.infinity,
        child: new ListView(
          children: [
            new Stack(
              children: <Widget>[
                _buildImage(context),
                _buildTopHeader(context),
                _buildProfileRow(context),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            _buildInformationCard(AppLocalization.of(context).name, AppLocalization.of(context).data, Icons.person, context),
            _buildInformationCard(AppLocalization.of(context).userName, AppLocalization.of(context).data, Icons.account_circle, context),
            _buildInformationCard(AppLocalization.of(context).email, AppLocalization.of(context).data, Icons.mail, context),
            _buildInformationCard(AppLocalization.of(context).mobile, AppLocalization.of(context).data, Icons.phone_android, context),
            _buildInformationCard(AppLocalization.of(context).address, AppLocalization.of(context).data, Icons.location_on, context),
            _buildInformationCard(AppLocalization.of(context).register,AppLocalization.of(context).data, Icons.store, context),
            _buildInformationCard(AppLocalization.of(context).facebookAccount, AppLocalization.of(context).data, Icons.account_box, context),
            _buildInformationCard(AppLocalization.of(context).twitterAccount, AppLocalization.of(context).data, Icons.account_box, context),
            _buildInformationCard(AppLocalization.of(context).linkedInAccount, AppLocalization.of(context).data, Icons.account_box, context),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return new ClipPath(
      clipper: DialogonalClipper(),
      child: new Image.asset(
        'assets/people.jpg',
        fit: BoxFit.fill,
        height: _imageHeight,
        width: double.infinity,
        colorBlendMode: BlendMode.srcOver,
        color: primaryColor.withOpacity(0.7),
      ),

    );
  }

  Widget _buildTopHeader(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            onPressed: () {},
            icon: new Icon(
              Icons.arrow_back,
              color: whiteColor,
            ),
            splashColor: blackColor,
          ),
          new Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: accentColor.withOpacity(0.7),
            ),
            child: new IconButton(
                icon: Icon(Icons.favorite),
                tooltip: "Add AD",
                color: whiteColor,
                splashColor: primaryColor,
                onPressed: () {

                }),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileRow(BuildContext context) {
    return new Padding(
      padding: new EdgeInsets.only(top:_imageHeight/2.5),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              new CircleAvatar(
                minRadius: 50.0,
                maxRadius: 50.0,
                backgroundImage: new AssetImage("assets/images.png"),
              ),
              Text("User Name",
                style: primaryText23,
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildInformationCard(String label, String info, IconData icon,BuildContext context){
    return Padding(
      padding: EdgeInsets.symmetric(vertical:5.0,horizontal:10.0),
      child: Container(
        width: MediaQuery.of(context).size.width ,
        child: Card(
            shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(10.0)),
            elevation: 3.0,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Container(
                    padding: EdgeInsets.only(right: 12.0),
                    decoration: new BoxDecoration(
                      border: new Border(
                          right: new BorderSide(
                            width: 1.0,
                            color: borderColor.withOpacity(0.8),
                          )),
                    ),
                    child: Icon(
                        icon,
                        color:accentColor
                    ),
                  ),
                ),
                SizedBox(width: 10.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 10,),
                    Text(
                      label,
                      style: primaryColorBoldText,
                    ),
                    Text(info, style: primaryColorText),
                    SizedBox(height: 10,),
                  ],
                )
              ],
            )
        ),
      ),
    );
  }
}

class DialogonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();
    path.lineTo(0.0, size.height);
    path.arcToPoint(Offset(size.width, size.height/0.4),radius: Radius.circular(2.0),);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}