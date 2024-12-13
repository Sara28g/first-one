import 'package:first_one/views/EditProfile.dart';
import 'package:first_one/views/HomePageScreen.dart';
import 'package:first_one/views/SingUpScreen.dart';
import 'package:flutter/material.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black26),
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
class SingUpScreenPageState extends State<SingUpScreen> {
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Warning'),
          content: const Text('warning'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'forgot password'),
              child: const Text('forgot password'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      ),
      child: const Text('Warning'),
    );
  }
}
class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();


  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: const Text('Log-In',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            )),
        backgroundColor: Color(0xFF252525),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              width: 350,
              height: 325,
              decoration: BoxDecoration(
                color:  Color(0xFF253622),
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
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                    width: 300,
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)
                        ),
                        hintText: 'UserName/Email',
                          hintStyle: TextStyle(color: Colors.white)
                      ),
                    )),
                const SizedBox(height: 2),

                const Text(
                  "password:",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,

                  ),
                  textAlign: TextAlign.left,

                ),
                const SizedBox(
                    width: 300,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)
                        ),
                        hintText: 'password',
                        hintStyle: TextStyle(color: Colors.white)
                      ),
                    )),
                const SizedBox(height: 10),

                TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(
                        Colors.white),
                    backgroundColor: MaterialStateProperty.all<Color>( Color(0xFF394d36)),

                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                          const HomePageScreen(title: "Log In")),

                    );
                  },
                  child: const Text(
                    "Log in",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),

                  /*
                  child: const Text(
                    "Log In",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),

                   */
                TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(
                        Colors.white),
                    backgroundColor: MaterialStateProperty.all<Color>( Color(0xFF394d36)),

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
