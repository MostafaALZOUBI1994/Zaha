import 'package:flutter/material.dart';
import 'package:zaha/styles/color.dart';

class TabViewSegment extends StatefulWidget {
  @override
  _TabViewSegmentState createState() => new _TabViewSegmentState();
}

class _TabViewSegmentState extends State<TabViewSegment> with SingleTickerProviderStateMixin {
  List<Tab> _tabs;
  List<Widget> _pages;
  static TabController _controller;
  @override
  void initState() {
    super.initState();
    _tabs = [
      new Tab(
        child: new Text(
          "Description",
          style: new TextStyle(color:blackColor),
        ),
      ),
      new Tab(
        child: new Text(
          "Products",
          style: new TextStyle(color: blackColor),
        ),
      ),
      new Tab(
        child: new Text(
          "Contact Information",
          style: new TextStyle(color: blackColor),
        ),
      ),
    ];
    _pages = [
      Scaffold(
        body: new Padding(
          padding: const EdgeInsets.all(14.0),
          child: new Center(
            child: new Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit"),
          ),
        ),
      ),
      Scaffold(
        body: new Padding(
          padding: const EdgeInsets.all(14.0),
          child: new Center(
            child: new Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit"),
          ),
        ),
      ),
      Scaffold(
        body: new Padding(
          padding: const EdgeInsets.all(14.0),
          child: new Center(
            child: new Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit"),
          ),
        ),
      )
    ];
    _controller = new TabController(
      length: _tabs.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new TabBar(
          isScrollable: true,
          controller: _controller,
          tabs: _tabs,
          indicatorColor: whiteColor,
        ),
        new Divider(
          height: 1.0,
        ),
        new SizedBox.fromSize(
          size: const Size.fromHeight(200.0),
          child: new TabBarView(
            controller: _controller,
            children: _pages,
          ),
        ),
      ],
    );
  }
}