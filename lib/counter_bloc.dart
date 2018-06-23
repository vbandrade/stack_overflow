//https://stackoverflow.com/questions/50995237/using-stream-sink-in-flutter

import 'package:flutter/material.dart';

import 'package:rxdart/rxdart.dart';
import 'dart:async';

class CounterBloc {
  int _count = 0;

  ReplaySubject<int> _increment = ReplaySubject<int>();
  Sink<int> get increment => _increment;

  BehaviorSubject<int> _countStream = BehaviorSubject<int>(seedValue: 0);
  Stream<int> get count => _countStream.stream;

  CounterBloc() {
    _increment.listen((increment) {
      _count += increment;
      _countStream.add(_count);
    });
  }
}

class CounterExample extends StatefulWidget {
  @override
  _CounterExampleState createState() => _CounterExampleState();
}

class _CounterExampleState extends State<CounterExample> {
  CounterBloc bloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder<int>(
              stream: bloc.count,
              initialData: 0,
              builder: (BuildContext c, AsyncSnapshot<int> data) {
                return Text(
                  '${data?.data??0}',
                  style: Theme.of(context).textTheme.display1,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              bloc.increment.add(2);
            },
            tooltip: 'Increment 2',
            child: Text("+2"),
          ),
          FloatingActionButton(
            onPressed: () {
              bloc.increment.add(1);
            },
            tooltip: 'Increment 1',
            child: Text("+1"),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
