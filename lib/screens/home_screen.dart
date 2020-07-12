import 'package:flutter/material.dart';
import 'package:skype_clone/resources/firebase_repositories.dart';
import 'package:skype_clone/screens/login_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseRepositories _repositories = FirebaseRepositories();
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            FlatButton(
                onPressed: () {
                  _repositories.signOut();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Text("Logout")),
            Text("Home Screen"),
          ],
        ),
      ),
    );
  }
}
