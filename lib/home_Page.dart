import 'package:chatui/chatScreen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Frenzy Chat'),
      ),
      body: ChatScreen(),
    );
  }
}
