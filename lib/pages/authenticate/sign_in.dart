// ignore_for_file: use_build_context_synchronously

import '../../data_,models/current_user_model.dart';
import 'package:flutter/material.dart';
import '/constants.dart' as constants;
import '../../services/firebase/login.dart';
// import 'package:firebase_shopping_list/services/firebase/login.dart' as login;

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isLoggedIn = false;

  final CurrentUser user = CurrentUser();
  // String userName = "";
  // String userPassword = "";

  @override
  void initState() {
    super.initState();
    autoLogIn();
  }

  void autoLogIn() async {
    bool signedIn = await user.getLogInPreferences();
    if (signedIn = true) {
      setState(() {
        isLoggedIn = true;
      });
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      //AppBar
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: const Text(constants.signInPageTitle),
      ),
      // body
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                user.userName = "Dad";
                user.email = "dad@gmail.com";
                user.password = "test123";
                user.userImagePath = "assets/images/tom.jpeg";
                // TODO Work with prefs loading in
                bool loggedIn =
                    await signInUser("dad@gmail.com", "test123") as bool;
                if (loggedIn) {
                  Navigator.pushNamed(context, '/home', arguments: user);
                }
              },
              child: const Text("Dad"),
            ),
            ElevatedButton(
              onPressed: () async {
                user.userName = "Jake";
                user.email = "jake@gmail.com";
                user.password = "test123";
                user.userImagePath = "assets/images/jake.jpeg";
                bool loggedIn =
                    await signInUser("dad@gmail.com", "test123") as bool;
                if (loggedIn) {
                  Navigator.pushNamed(context, '/home', arguments: user);
                }
              },
              child: const Text("Jake"),
            ),
            ElevatedButton(
              onPressed: () async {
                user.userName = "Amber";
                user.email = "amber@gmail.com";
                user.password = "test123";
                user.userImagePath = "assets/images/amber.jpeg";
                bool loggedIn =
                    await signInUser("dad@gmail.com", "test123") as bool;
                if (loggedIn) {
                  Navigator.pushNamed(context, '/home', arguments: user);
                }
              },
              child: const Text("Amber"),
            ),
          ],
        ),
      ),
    );
  }
}
