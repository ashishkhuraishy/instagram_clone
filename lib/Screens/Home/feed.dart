import 'package:flutter/material.dart';
import 'package:instagram_clone/Services/Auth.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Instagram",
          style: TextStyle(
              fontFamily: "BillaBong", fontSize: 36, color: Colors.black),
        ),
        elevation: 0,
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: IconButton(
              onPressed: () {
                AuthService().logOutUser();
              },
              icon: Icon(
                Icons.account_circle,
                color: Colors.black,
                size: 28,
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: Text("Your Feeds"),
      ),
    );
  }
}
