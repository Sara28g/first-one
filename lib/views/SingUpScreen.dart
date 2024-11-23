import 'package:first_one/Utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:first_one/Utils/db.dart';
import 'HomePageScreen.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({super.key, required this.title});

  final String title;

  @override
  State<SingUpScreen> createState() => SingUpScreenPageState();
}

class SingUpScreenPageState extends State<SingUpScreen> {
  void _incrementCounter() {}
  final _txtUserName = new TextEditingController();
  final _txtFirstName = TextEditingController();
  final _txtLastName = new TextEditingController();
  final _txtEmail = new TextEditingController();
  final _txtPassword = new TextEditingController();
  final _txtComfirmPassword = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sing-Up',
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
              height: 650,
              decoration: BoxDecoration(
                color: Colors.blueGrey.shade200,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(height: 10),
                const Text(
                  "First Name:",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: _txtFirstName,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'First Name',
                    ),
                  ),
                ),
                const SizedBox(height: 2),
                const Text(
                  "Last Name:",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                    width: 300,
                    child: TextField(
                      controller: _txtLastName,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Last Name:',
                      ),
                    )),
                const SizedBox(height: 2),
                const Text(
                  "UserName:",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                    width: 300,
                    child: TextField(
                      controller: _txtUserName,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'UserName',
                      ),
                    )),
                const SizedBox(height: 2),
                const Text(
                  "Email:",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                    width: 300,
                    child: TextField(
                      controller: _txtEmail,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Email',
                      ),
                    )),
                const SizedBox(height: 2),
                const Text(
                  " Password:",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                    width: 300,
                    child: TextField(
                      controller: _txtPassword,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Password',
                      ),
                    )),
                const SizedBox(height: 2),
                const Text(
                  "Confirm Password:",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                    width: 300,
                    child: TextField(
                      controller: _txtComfirmPassword,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Confirm Password:',
                      ),
                    )),
                const SizedBox(height: 10),
                TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.blueGrey.shade900),
                  ),
                  onPressed: () {
                    var uti = new Utils();
                    insertUser(_txtFirstName.text, _txtLastName, _txtPassword);
                    if (_txtFirstName.text.trim().isEmpty) {
                      uti.showMyDialog(
                          context,
                          "YOUR MUST FILL ALL BOXES",
                          "",
                          SingUpScreen(
                            title: '',
                          ));
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const HomePageScreen(title: "Log In")),
                      );
                    }
                  },
                  child: const Text(
                    " create",
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
