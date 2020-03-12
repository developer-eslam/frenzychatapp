import 'package:chatui/chat_Messages.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  final List<ChatMassage> _messages = <ChatMassage>[];
  void _handleSubmited(String text) {
    _textEditingController.clear();

    ChatMassage massage = ChatMassage(
      text: text,
    );

    setState(() {
      _messages.insert(0, massage);
    });
  }

  Widget _textComposerWidget() {
    return IconTheme(
      data: IconThemeData(
        color: Colors.greenAccent,
      ),
          child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                decoration: InputDecoration.collapsed(hintText: "Send a Message"),
                controller: _textEditingController,
                onSubmitted: _handleSubmited,
              ),
            ),
            Container(
              child: IconButton(
                icon: Icon(Icons.send),
                onPressed: () => _handleSubmited(_textEditingController.text),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
        children: <Widget>[
          Flexible(child: ListView.builder(
            padding: EdgeInsets.all(8.0),
            reverse: true,
            itemBuilder: (ctx,position)  => _messages[position],
            itemCount: _messages.length,
          ),
          
          ),
          Divider(height: 1.0,),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
            ),
            child: _textComposerWidget(),
          ),
        ],
      );
  }
}
