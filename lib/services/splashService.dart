import 'dart:async';

import 'package:demo_app/interface/splashInterface.dart';
import 'package:demo_app/views/pages/search.dart';
import 'package:flutter/material.dart';

class SplashService implements splashInterface {

@override 
  startTimer(int milliseconds, context, timeout, ms) {
    var duration = milliseconds == null ? timeout : ms * milliseconds;
    return Timer(duration, () => handleTimeout(context));
    
  }

  @override 
   void handleTimeout(BuildContext context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (ctxt) => SearchScreen()));
  }
}