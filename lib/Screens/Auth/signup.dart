import 'package:flutter/material.dart';
import 'package:instagram_clone/Constants/Loading.dart';
import 'package:instagram_clone/Services/Auth.dart';
class SignUp extends StatefulWidget {

  final Function toggleView;
  SignUp({this.toggleView});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

  String _userName,_email, _password;
  bool loading = false;

  _submitForm() async{
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      print("UserName: $_userName\tEmail: $_email\tPassword: $_password");
      print("Sucess");
      setState(() {
        loading = true;
      });
      dynamic result = await AuthService().signUpUser(context: context, userName: _userName, password: _password, email: _email, profieImage: "");
      if(result == null){
        setState(() {
          loading = false;
        });
        print('Something Went Wrong');
      }else{
        print(result.uid);
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Instagram',
              style: TextStyle(fontFamily: "BillaBong", fontSize: 50.0),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "UserName",
                      ),
                      validator: (input) =>
                          input.trim().isEmpty ? 'UserName Cannot Be Empty' : null,
                      onSaved: (input) => _userName = input,
                      maxLines: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Email",
                      ),
                      validator: (input) =>
                          !input.contains('@') ? 'Enter a valid Email' : null,
                      onSaved: (input) => _email = input,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Password",
                      ),
                      validator: (input) =>
                          input.length < 6 ? 'Password too Short' : null,
                      onSaved: (input) => _password = input,
                      obscureText: true,
                    ),
                  ),
                  Container(
                    width: 250,
                    child: FlatButton(
                      onPressed: _submitForm,
                      padding: EdgeInsets.all(8.0),
                      child: Text("Sign Up", style: TextStyle(fontSize: 18.0),),
                      color: Colors.blue,
                      textColor: Colors.white,
                    ),
                  ),
                  Container(
                    width: 250,
                    child: FlatButton(
                      onPressed: (){
                        widget.toggleView();
                      },
                      padding: EdgeInsets.all(8.0),
                      child: Text("Log In", style: TextStyle(fontSize: 18.0),),
                      color: Colors.blue,
                      textColor: Colors.white,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}