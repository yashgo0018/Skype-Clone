import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skype_clone/resources/firebase_repositories.dart';
import 'package:skype_clone/screens/home_screen.dart';
import 'package:skype_clone/utils/universal_variables.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoginPressed = false;
  FirebaseRepositories _repositories = FirebaseRepositories();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UniversalVariables.blackColor,
      body: Center(
        child: isLoginPressed
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Loading...",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              )
            : loginButton(),
      ),
    );
  }

  Widget loginButton() {
    return Shimmer.fromColors(
      baseColor: Colors.white,
      highlightColor: UniversalVariables.senderColor,
      child: FlatButton(
          padding: EdgeInsets.all(35),
          onPressed: () => performLogin(),
          child: Text(
            "Login",
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.2,
            ),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
    );
  }

  void performLogin() async {
    setState(() {
      isLoginPressed = true;
    });
    await _repositories.signIn().then((FirebaseUser user) {
      if (user != null) {
        authenticate(user);
      } else {
        print("Error Occured");
      }
    });
    setState(() {
      isLoginPressed = false;
    });
  }

  void authenticate(FirebaseUser user) async {
    bool isOldUser = await _repositories.authenticateUser(user);
    if (!isOldUser) {
      await _repositories.addUserToDB(user);
    }
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }
}
