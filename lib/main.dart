import 'package:flutter/material.dart';
import 'counter_bloc.dart';
import 'horizontal_and_vertical_scrollable_widgets.dart';
import 'ex_dismissable.dart';

void main() async {
  runApp(MaterialApp(
    title: 'stack overflow',
    theme: ThemeData(
      primarySwatch: Colors.pink,
    ),
    routes: {},
    home: CounterExample(),
  ));
}
