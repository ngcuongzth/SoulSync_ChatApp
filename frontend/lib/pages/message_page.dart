import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:soul_app/core/theme.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Message',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 70,
        actions: [
          IconButton(
            onPressed: () {
              log('clicked');
            },
            icon: Icon(Icons.search),
            color: Colors.white,
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              'Recent',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          Container(
            height: 100,
            padding: EdgeInsets.all(5),
            child: _buildListView(context),
          ),
          SizedBox(height: 10),
          Expanded(
              child: Container(
            decoration: BoxDecoration(
              color: DefaultColors.messageListPage,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: ListView(
              children: [
                _buildMessageTile('Dammy', 'dammy@mall.com', '08:43'),
                _buildMessageTile('Kelvin', 'kelvin@mall.com', '09:43'),
                _buildMessageTile('Jay', 'jay@mall.com', '01:43'),
                _buildMessageTile('Antonio', 'dammy@mall.com', '18:43'),
                _buildMessageTile('Franky', 'dammy@mall.com', '05:43'),
              ],
            ),
          )),
        ],
      ),
    );
  }

  Widget _buildListView(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        _buildRecentContact('John', context),
        _buildRecentContact('Ema', context),
        _buildRecentContact('Chan', context),
        _buildRecentContact('Kelly', context),
        _buildRecentContact('Tom', context),
        _buildRecentContact('David', context),
      ],
    );
  }

  Widget _buildRecentContact(String name, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Column(children: [
        // CircleAvatar(
        //   radius: 30,
        //   backgroundImage: AssetImage("assets/png_avatar.png"),
        // ),
        Lottie.asset(
          'assets/images/lotties/default_avatar.json',
          height: 50,
          width: 50,
        ),
        SizedBox(height: 5),
        Text(
          name,
          style: Theme.of(context).textTheme.bodyMedium,
        )
      ]),
    );
  }

  Widget _buildMessageTile(String name, String message, String time) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      leading: CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage("assets/png_avatar.png"),
      ),
      title: Text(
        name,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        message,
        style: TextStyle(
          color: Colors.grey,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      trailing: Text(
        time,
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }
}
