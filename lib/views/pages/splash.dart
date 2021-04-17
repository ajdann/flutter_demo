import 'package:demo_app/utils/variables/splashVariables.dart';
import 'package:demo_app/viewModel/splashViewModel.dart';
import 'package:demo_app/utils/shared/sizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    
    SizeConfig().init(context);
   
    startTimeout(3000, context, timeout, ms);

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
