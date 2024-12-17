import 'package:flutter/material.dart';
import 'package:first_one/views/LogInScreen.dart';
import 'dart:math'; // For circular motion math

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

  @override
  Widget build(BuildContext context) {
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
