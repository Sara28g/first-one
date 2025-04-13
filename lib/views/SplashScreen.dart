import 'dart:io';
import 'package:video_player/video_player.dart';
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
  late VideoPlayerController _controller;


  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset('assets/sp.mp4')
      ..initialize().then((_) {
        setState(() {});
        _controller.setLooping(false);
        _controller.play();
      });

    _controller.addListener(() {
      if (_controller.value.isInitialized &&
          !_controller.value.isPlaying &&
          _controller.value.position >= _controller.value.duration) {
      Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => LogInScreen()), // Your LoginScreen
      );
      }
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

    return Scaffold(
      body: _controller.value.isInitialized
          ? Stack(
        fit: StackFit.expand,
        children: [
          // Background Video
          SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover, // Ensures full-screen fill
              child: SizedBox(
                width: _controller.value.size.width,
                height: _controller.value.size.height,
                child: VideoPlayer(_controller),
              ),
            ),
          ),

          // Optional: Black overlay to improve contrast
          Container(
            color: Colors.black.withOpacity(0.1), // Light overlay
          ),
        ],
      )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
