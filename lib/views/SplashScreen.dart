import 'dart:io';

import 'package:flutter/material.dart';
import 'package:first_one/views/LogInScreen.dart';
import 'dart:math';

import '../Utils/Utils.dart'; // For circular motion math

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _Animation;


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3), // Duration of the animation
    );

    _Animation = Tween<double>(begin: 0.0, end: 2.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    // Start the animations
    _controller.forward();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => LogInScreen()), // Your LoginScreen
            );
          });


  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  checkConction() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        // print('connected to internet');// print(result);// return 1;
      }
    } on SocketException catch (_) {
      // print('not connected to internet');// print(result);
      var uti = new Utils();
      uti.showMyDialog2(context, "האפליקציה דורשת חיבור לאינטרנט", "נא להתחבר בבקשה");
      return;
    }
  }


  @override
  Widget build(BuildContext context) {
    checkConction();

    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black, // Background color of the splash screen
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // FadeTransition for logo (smaller size)
            FadeTransition(
              opacity: _Animation,
              child: Image.asset(
                'lib/images/logo.jpeg', // Logo image
                height: 150, // Adjust height to make the logo smaller
                width: 150, // Adjust width accordingly
              ),
            ),
            // Circular motion for the wooden banner
          ],
        ),
      ),
    );
  }
}
