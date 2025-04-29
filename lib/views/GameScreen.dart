import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';
import 'package:flutter/services.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> with WidgetsBindingObserver {
  bool _isLaunching = true;
  String _statusMessage = 'Starting Escape Room game...';
  bool _gameWasLaunched = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    // Use a delay to ensure the widget is fully built
    Future.delayed(const Duration(milliseconds: 500), () {
      _launchGodotGame();
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  // This will be called when the app returns to the foreground
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed && _gameWasLaunched) {
      // The app has returned to the foreground, likely because the Godot game was closed
      // Navigate back to home page
      if (mounted) {
        Navigator.of(context).pop();
      }
    }
  }

  Future<void> _launchGodotGame() async {
    if (Platform.isAndroid) {
      // Android intent format for opening apps
      final Uri uri = Uri.parse('android-app://com.sara.escaperoom');
      // Alternative approach using market URI
      final Uri marketUri = Uri.parse('market://details?id=com.sara.escaperoom');

      try {
        bool launched = await launchUrl(
          uri,
          mode: LaunchMode.externalApplication,
        );

        if (!launched) {
          // Try alternative launch method
          launched = await launchUrl(
            marketUri,
            mode: LaunchMode.externalApplication,
          );

          if (!launched) {
            throw 'Could not launch game';
          }
        }

        // Mark that we successfully launched the game
        _gameWasLaunched = true;

        // We don't immediately pop - instead we'll wait for the app to return to foreground
        setState(() {
          _isLaunching = false;
          _statusMessage = 'Game launched. Close the game to return here.';
        });
      } catch (e) {
        setState(() {
          _isLaunching = false;
          _statusMessage = 'Error launching game: $e\nMake sure the app is installed.';
        });
        print('Error launching app: $e');
      }
    } else {
      setState(() {
        _isLaunching = false;
        _statusMessage = 'This feature is only available on Android';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Loading Game')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           /* if (_isLaunching) const CircularProgressIndicator(),
            const SizedBox(height: 20),
            Text(_statusMessage),
            const SizedBox(height: 20),
            if (!_isLaunching && !_gameWasLaunched)
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isLaunching = true;
                    _statusMessage = 'Starting Escape Room game...';
                  });
                  _launchGodotGame();
                },
                child: const Text('Try Again'),
              ),
            if (_gameWasLaunched)
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Return to Menu'),
              ),

            */
          ],
        ),
      ),
    );
  }
}