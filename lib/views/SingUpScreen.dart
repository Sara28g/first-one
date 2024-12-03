import 'package:first_one/Utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:first_one/Utils/db.dart';
import '../models/UserModel.dart';
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
  final _txtfirstName = TextEditingController();
  final _txtlastName = new TextEditingController();
  final _txtEmail = new TextEditingController();
  final _txtpassword = new TextEditingController();
  final _txtComfirmPassword = new TextEditingController();

  void insertUserFunc()
    {
      if (_txtfirstName.text.trim().isEmpty) {
          var uti = new Utils();
         uti.showMyDialog(context, "required", "YOUR MUST FILL ALL BOXES", "info", SingUpScreen(title: '',),);
    }
      else
    {
      var user = new User();
       user.firstName=_txtfirstName.text;
       user.lastName=_txtlastName.text;
       user.password=_txtpassword.text;
       user.Email=_txtEmail.text;
      insertUser(user);

       var uti =new Utils();
       uti.showMyDialog(context, "success", "you registed successfully", "screen", HomePageScreen(title: ""), );

      // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //       builder: (context) =>
          //       const HomePageScreen(title: "Log In")),);
/*
       _txtFirstName.text = "";
       _txtLastName.text = "";
      _txtPassword.text="";
      _txtEmail.text="";
*/

  }
  }

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
                    controller: _txtfirstName,
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
                      controller: _txtlastName,
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
                      controller: _txtpassword,
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
                      insertUserFunc();

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
