//https://stackoverflow.com/questions/50916661/why-dismissible-widget-is-not-performing-well

import 'package:flutter/material.dart';

class ChatMessage {
  String text;
  ChatMessage(this.text);
}

class ChatScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScreenState();
  }
}

class _ScreenState extends State<ChatScreen> {
  final List<ChatMessage> _message = <ChatMessage>[
    ChatMessage("msg 1"),
    ChatMessage("msg 2"),
    ChatMessage("msg 3"),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        // padding: new EdgeInsets.all(8.0),
        // reverse: true,
        itemCount: _message.length,
        itemBuilder: (_, int index) {
          return Text(_message[index].text);

          return Dismissible(
              key: Key("${index}"),
              onDismissed: (direction) {
                _message.remove(index);
              },
              child: Text(_message[index].text));
        });
  }
}
