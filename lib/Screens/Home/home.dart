import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/Screens/Home/feed.dart';
import 'package:instagram_clone/Screens/Home/new_post.dart';
import 'package:instagram_clone/Screens/Home/profile.dart';
import 'package:instagram_clone/Screens/Home/search.dart';
import 'package:instagram_clone/Services/Auth.dart';

import 'notifications.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }


  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       backgroundColor: Colors.white,
       title: Text("Instagram", style: TextStyle(fontFamily: "BillaBong", fontSize: 32.0, color: Colors.black),),
       actions: <Widget>[
         IconButton(
           icon: Icon(
             Icons.account_circle,
             size: 24.0,
             color: Colors.black,
           ),
           onPressed: () async {
             await AuthService().logOutUser();
           },
         ), 
       ],
       centerTitle: true,
     ),

     body: PageView(
       controller: _pageController,
       children: <Widget>[
         FeedScreen(),
         Search(),
         NewPost(),
         Notifications(),
         Profile(),
       ],
       onPageChanged: (int index) {
         setState(() {
           currentIndex = index;
         });
       },
     ),
     bottomNavigationBar: BottomNavigationBar(
       selectedItemColor: Colors.black,
       unselectedItemColor: Colors.grey,
       currentIndex: currentIndex,
       onTap: (int index) {
         setState(() {
           currentIndex = index;
         });
         _pageController.animateToPage(index, duration: Duration(milliseconds: 200), curve: Curves.ease);
       },
       items: [
         BottomNavigationBarItem(
           icon: Icon(
             Icons.home,
             size: 30.0,
           ),
           title: Text('Home')
         ),
         BottomNavigationBarItem(
           icon: Icon(
             Icons.search,
             size: 30.0,
           ),
           title: Text('Search')
         ),
         BottomNavigationBarItem(
           icon: Icon(
             Icons.photo_camera,
             size: 30.0,
           ),
           title: Text('Post')
         ),
         BottomNavigationBarItem(
           icon: Icon(
             Icons.notifications,
             size: 30.0,
           ),
           title: Text('Notifications')
         ),
         BottomNavigationBarItem(
           icon: Icon(
             Icons.account_circle,
             size: 30.0,
           ),
           title: Text('Profile')
         ),
       ],
     ),
   );
  }
}