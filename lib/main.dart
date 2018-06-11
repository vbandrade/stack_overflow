import 'package:flutter/material.dart';

import 'horizontal_and_vertical_scrollable_widgets.dart';

void main() async {
  runApp(MaterialApp(
    title: 'stack overflow',
    theme: ThemeData(
      primarySwatch: Colors.pink,
    ),
    routes: {},
    home: HorizontalAndVerticalScrollableWidgets(),
  ));
}
