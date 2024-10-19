import 'package:first_one/views/HomePageScreen.dart';
import 'package:first_one/views/SingUpScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

void main() {
  runApp(const MyApp());
}
//sara

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'sara',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey.shade200),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'sara'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log-In',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            )),
        backgroundColor: Colors.blueGrey.shade800,
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              width: 350,
              height: 325,
              decoration: BoxDecoration(
                color: Colors.blueGrey.shade200,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text(
                  "UserName or Email:",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                    width: 300,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'UserName/Email',
                      ),
                    )),
                const SizedBox(height: 2),

                const Text(
                  "password:",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,

                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                    width: 300,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'password',
                      ),
                    )),
                const SizedBox(height: 10),

                TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(
                        Colors.white),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey.shade900),

                  ),
                  onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                  builder: (context) => HomePageScreen(title: "Log In")),
                  );
                  },
                  child: const Text(
                    "Log In",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
                TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(
                        Colors.white),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey.shade900),

                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const SingUpScreen(title: "new account")),
                    );
                  },
                  child: const Text(
                    "NEW ACCOUNT",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
