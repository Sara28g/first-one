
import 'dart:io';

import 'package:first_one/views/SplashScreen.dart';
import 'package:flutter/material.dart';

import 'Utils/Utils.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override




  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(), // Set SplashScreen as the first screen
    );
  }
}

