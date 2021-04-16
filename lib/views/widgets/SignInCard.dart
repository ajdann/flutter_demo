import 'package:demo_app/utils/textVariables/textVariables.dart';
import 'package:demo_app/viewModel/signInViewModel.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

Widget getSingInCard(_currentUser) {
    GoogleSignInAccount user = _currentUser;
    if (user != null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ListTile(
            leading: GoogleUserCircleAvatar(
              identity: user,
            ),
            title: Text(user.displayName ?? ''),
            subtitle: Text(user.email),
          ),
          const Text("Signed in successfully."),
          Text(contactText),
          ElevatedButton(
            child: const Text('SIGN OUT'),
            onPressed: handleSignOut,
          ),
          ElevatedButton(
            child: const Text('REFRESH'),
            onPressed: () => handleGetContact(user),
          ),
        ],
      );
    } else {
      return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: handleSignIn, child: Text('Log in!')),
              ],
            )),
          ]);
    }
  }