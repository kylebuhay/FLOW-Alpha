import 'package:flutter/material.dart';
import 'dart:async';

import 'main.dart'; // Import your main screen
import 'WelcomePage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key); // Add a const constructor

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Add a delay to display the splash screen for a few seconds
    Timer(Duration(seconds: 4), () {
      // Navigate to the main screen after the delay
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => WelcomePage()), // Replace MainScreen with your actual main screen
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff215b75),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: [
          ///**If you have exported images you must have to copy those images in assets/images directory.
          Image(
            image: AssetImage("assets/flow_logo_white.png"),
            height: 250,
            width: MediaQuery.of(context).size.width * 1,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}