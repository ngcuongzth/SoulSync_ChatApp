import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:soul_app/core/theme.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/png_avatar.png'),
              ),
              SizedBox(width: 10),
              Text(
                'Dammy Hookines',
                style: Theme.of(context).textTheme.titleMedium,
              )
            ],
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                log('ChatPage button pressed!');
              },
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(20),
                children: [
                  _buildReceivedMessage(context, "Hey friend!"),
                  _buildSentMessage(context, "How are you, Dammy?"),
                  _buildReceivedMessage(context, "I'm fine."),
                  _buildReceivedMessage(context, "Where are u going?"),
                  _buildSentMessage(context, "John'house, he lives in Hanoi."),
                  _buildReceivedMessage(context, "👌👌👌"),
                ],
              ),
            ),
            _buildMessageInput(context)
          ],
        ));
  }

  Widget _buildReceivedMessage(BuildContext context, String message) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(right: 30, top: 5, bottom: 5),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: DefaultColors.receiverMessage,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          message,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }

  Widget _buildSentMessage(BuildContext context, String message) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.only(left: 30, top: 5, bottom: 5),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: DefaultColors.senderMessage,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          message,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }

  Widget _buildMessageInput(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: DefaultColors.sentMessageInput,
          borderRadius: BorderRadius.circular(5)),
      // margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
      child: Row(
        children: [
          GestureDetector(
              child: Icon(Icons.camera_alt_outlined, color: Colors.grey),
              onTap: () {
                log('Camera Icon Tapped!');
              }),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
                decoration: InputDecoration(
                  hintText: "Message",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,
                ),
                style: TextStyle(
                  color: Colors.white,
                )),
          ),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            child: Icon(Icons.send, color: Colors.grey),
            onTap: () {
              log("Send Icon Tapped!");
            },
          )
        ],
      ),
    );
  }
}
