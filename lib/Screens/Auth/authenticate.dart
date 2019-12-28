import 'package:flutter/material.dart';
import 'package:instagram_clone/Screens/Auth/login.dart';
import 'package:instagram_clone/Screens/Auth/signup.dart';

class Authenticate extends StatefulWidget {

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool isLogIn = true;

  void toggleView(){
    setState(() {
      isLogIn = !isLogIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(isLogIn){
      return LogIn(toggleView: toggleView,);
    }else{
      return SignUp(toggleView: toggleView,);
    }
  }
}