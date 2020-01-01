import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final GlobalKey _formKey = GlobalKey<FormState>();
  String _userName, _bio;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: Column(
          children: <Widget>[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/images/profile.jpg"),
                    radius: 50,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 8),
                    child: GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Edit Profile Image",
                        style: TextStyle(color: Colors.blueAccent),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "UserName", prefixIcon: Icon(Icons.person)),
                    validator: (input) => input.trim().isEmpty
                        ? "Username Cannot be empty!"
                        : null,
                    onSaved: (input) => _userName = input,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Bio", prefixIcon: Icon(Icons.edit)),
                    maxLength: 150,
                    validator: (input) => input.length > 150
                        ? "Bio Cannot be greater than 150!"
                        : null,
                    onSaved: (input) => _bio = input,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 24),
                    child: FlatButton.icon(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      color: Colors.blue,
                      textColor: Colors.white,
                      icon: Icon(Icons.save),
                      
                      label: Text("Save Changes"),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
