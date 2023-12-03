import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:live_chat/constants.dart';

final _fire = FirebaseFirestore.instance;
late User loggedInUser;

class ChatScreen extends StatefulWidget {
  static const String id = "chat_screen";

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageTextController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  late User loggedInUser;

  late String messageText;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  void getMessages() async {
    final messagesSrc = await _fire.collection("messages").get();

    for (var message in messagesSrc.docs) {
      print(message.data());
    }
  }

  void messagesStream() async {
    try {
      await for (var snapshot in _fire.collection("messages").snapshots()) {
        for (var message in snapshot.docs) {
          print(message.data());
        }
      }
    } catch (e) {
      print("there was an error\n=======================================\n");
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              color: kColor2,
              icon: Icon(Icons.logout),
              onPressed: () {
                // _auth.signOut();
                // Navigator.pop(context);

                messagesStream();
              }),
        ],
        title: Text(
          '️Chat',
          style: TextStyle(
            color: kColor2,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: kColor1,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
              stream: _fire.collection("messages").snapshots(),
              builder: (context, snapshot) {
                List<MessageBubble> messageBubbles = [];
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: kColor2,
                    ),
                  );
                }
                final messages = snapshot.data!.docs;
                // List<Text> messageWidgets = [];
                for (var message in messages) {
                  final messageText = message["text"];
                  final messageSender = message["sender"];

                  final messageWidget = MessageBubble(
                      sender: messageSender, text: messageText, isMe: false);

                  messageBubbles.add(messageWidget);
                }
                // return Column(
                //   children: messageWidgets,
                // );
                return Expanded(
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    children: messageBubbles,
                  ),
                );
              },
            ),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (value) {
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  GestureDetector(
                    child: IconButton(
                      color: kColor1,
                      icon: Icon(Icons.send),
                      onPressed: () {
                        _fire.collection("messages").add({
                          "sender": loggedInUser.email,
                          "text": messageText,
                        });
                        messageTextController.clear();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//this is the class for the message bubble
class MessageBubble extends StatelessWidget {
  MessageBubble({required this.sender, required this.text, required this.isMe});

  final String sender;
  final String text;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            sender,
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.black54,
            ),
          ),
          Material(
            borderRadius: isMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0))
                : BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
            elevation: 5.0,
            color: isMe ? Colors.lightBlueAccent : Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                text,
                style: TextStyle(
                  color: isMe ? Colors.white : Colors.black54,
                  fontSize: 15.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
