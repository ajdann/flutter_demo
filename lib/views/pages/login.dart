import 'package:demo_app/utils/loginVariables/loginVariables.dart';
import 'package:demo_app/views/widgets/SignInCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';




class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GoogleSignInAccount _currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: getSingInCard(_currentUser)),
    );
  }
}
