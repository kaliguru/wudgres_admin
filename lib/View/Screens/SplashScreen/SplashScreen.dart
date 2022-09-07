import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wudgres_admin_final/Utils/Image_Constrants.dart';
import 'package:wudgres_admin_final/View/Screens/LoginScreen/LoginScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

setTimer()
{
  Timer(Duration(seconds: 3), () {

    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (c)=>LoginScreen()), (route) => false);

  });
}
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    setTimer();
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Container(
          // color: Colors.black,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Center(child: Image.asset(ImageConstrants.APPLOGO)),
        ),
      ),
    );
  }
}
