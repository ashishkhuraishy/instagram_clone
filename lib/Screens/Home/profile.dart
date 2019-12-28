import 'dart:ui';

import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: const EdgeInsets.fromLTRB(22, 22, 22, 0),
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(right: 8.0),
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                backgroundImage: AssetImage("assets/images/profile.jpg"),
                radius: 50,
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Text("8",
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold)),
                            Text(
                              'Posts',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Text("3K",
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold)),
                            Text(
                              'Followers',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Text("300",
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold)),
                            Text(
                              'Following',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.all(8.0),
                    width: 250,
                    child: FlatButton.icon(
                      color: Colors.blue,
                      textColor: Colors.white,
                      icon: Icon(Icons.edit),
                      label: Text('Edit Profile'),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        Text(
          "User Name",
          style: Theme.of(context).textTheme.body1,
        ),
        Text(
          "Bio",
          style: Theme.of(context).textTheme.caption,
        ),
        SizedBox(
          height: 30.0,
        ),
        Divider(
          thickness: 2,
        )
      ],
    ));
  }
}
