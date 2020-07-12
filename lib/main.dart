import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:zaha/pages/login_page.dart';

import 'package:zaha/styles/color.dart';
import 'package:zaha/styles/color.dart' as prefix0;

import 'package:zaha/widgets/product_viewmodel_widget.dart';

import 'localization/localization_delegate.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ProductViewModel.load();
    runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = false;
  AppLocalizationDelegate _localeOverrideDelegate =
  AppLocalizationDelegate(Locale('en', ''));
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        _localeOverrideDelegate
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('ar', '')
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor:prefix0.primaryColor,
        accentColor: accentColor,
      ),
      home: Scaffold(body: LoginPage()),
    );
  }
}

