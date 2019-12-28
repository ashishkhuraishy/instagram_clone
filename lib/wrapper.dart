import 'package:flutter/material.dart';
import 'package:instagram_clone/Screens/Auth/authenticate.dart';
import 'package:instagram_clone/Screens/Home/feed.dart';
import 'package:provider/provider.dart';

import 'Models/User.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    if(user == null){
      return Authenticate();
    } else {
      return FeedScreen();
    } 

  }
}