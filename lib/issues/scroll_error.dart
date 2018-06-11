// https://github.com/flutter/flutter/issues/18368

import 'package:flutter/material.dart';

void main() async {
  runApp(MaterialApp(
    title: 'stack overflow',
    theme: ThemeData(
      primarySwatch: Colors.pink,
    ),
    routes: {},
    home: MyWidget(),
  ));
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget tagList = Container(
      color: Colors.green,
      height: 40.0,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return Text("Text $index");
        },
      ),
    );

    return Scaffold(
        appBar: AppBar(
          title: Text("Test title"),
        ),
        body: Container(
          color: Colors.grey[400],
          child: tagList,
          padding: EdgeInsets.all(20.0),
          margin: EdgeInsets.all(20.0),
        ));
  }
}
