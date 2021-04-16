import 'dart:async';

import 'package:demo_app/views/pages/login.dart';
import 'package:demo_app/utils/shared/sizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  void handleTimeout(BuildContext context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (ctxt) => Login()));
  }
  static const timeout = Duration(seconds: 3);
  static const ms = Duration(milliseconds: 1);


  @override
  Widget build(BuildContext context) {
    
    SizeConfig().init(context);
    Timer startTimeout(int milliseconds) {
    var duration = milliseconds == null ? timeout : ms * milliseconds;
    return Timer(duration, () => handleTimeout(context));
    
  }
    startTimeout(3000);

    return Scaffold(
     
      body: Center(
        child: Image.asset('assets/index.png',
            height: SizeConfig.blockSizeVertical * 20,
            width: SizeConfig.blockSizeHorizontal * 20),
      ),
     // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
