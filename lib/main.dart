import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/Screens/Auth/login.dart';
import 'package:instagram_clone/Screens/Home/feed.dart';
import 'package:instagram_clone/Screens/Auth/signup.dart';
import 'package:instagram_clone/Services/Auth.dart';
import 'package:instagram_clone/wrapper.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
        value: AuthService().user,
          child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Wrapper(),
        routes: {
          'login': (context) => LogIn(),
          'signup': (context) => SignUp(),
        },
      ),
    );
  }
}
