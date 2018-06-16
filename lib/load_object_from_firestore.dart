// https://stackoverflow.com/questions/50808513/how-do-you-load-array-and-object-from-cloud-firestore-in-flutter

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'firebase_auth_service.dart';

void main() async {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  final firebaseAuth = new FirebaseAuthService();

  MyApp() {
    firebaseAuth.anonymousLogin();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Center(
                child: FlatButton(
      color: Colors.amber,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text("get Game Record"),
          StreamBuilder<GameRecord>(
            stream: getGame(),
            builder: (BuildContext c, AsyncSnapshot<GameRecord> data) {
              if (data?.data == null) return Text("Error");

              GameRecord r = data.data;

              return Text("${r.creationTimestamp} + ${r.name}");
            },
          ),
        ],
      ),
      onPressed: () {
        getGame();
      },
    ))));
  }
}

Stream<GameRecord> getGame() {
  return Firestore.instance
      .collection("games")
      .document("zZJKQOuuoYVgsyhJJAgc")
      .get()
      .then((snapshot) {
    try {
      return GameRecord.fromSnapshot(snapshot);
    } catch (e) {
      print(e);
      return null;
    }
  }).asStream();
}

class GameReview {
  String name;
  int howPopular;
  List<String> reviewers;

  GameReview.fromMap(Map<dynamic, dynamic> data)
      : name = data["name"],
        howPopular = data["howPopular"],
        reviewers = List.from(data['reviewers']);
}

class ItemCount {
  int itemType;
  int count;

  ItemCount.fromMap(Map<dynamic, dynamic> data)
      : itemType = data['itemType'],
        count = data['count'];
}

class GameRecord {
  String documentID;
  String name;
  int creationTimestamp;
  List<int> ratings;
  List<String> players;
  GameReview gameReview;
  List<ItemCount> itemCounts;

  GameRecord.fromSnapshot(DocumentSnapshot snapshot)
      : documentID = snapshot.documentID,
        name = snapshot['name'],
        creationTimestamp = snapshot['creationTimestamp'],
        ratings = List.from(snapshot['ratings']),
        players = List.from(snapshot['players']),
        gameReview = GameReview.fromMap(snapshot['gameReview']),
        itemCounts = snapshot['itemCount'].map<ItemCount>((item) {
          return ItemCount.fromMap(item);
        }).toList();
}
