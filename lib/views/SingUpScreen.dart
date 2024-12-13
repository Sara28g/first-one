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
  final _txtUserName =  TextEditingController();
  final _txtfirstName = TextEditingController();
  final _txtLastName =  TextEditingController();
  final _txtEmail =  TextEditingController();
  final _txtPassword =  TextEditingController();
  final _txtComfirmPassword =  TextEditingController();

  void insertUserFunc()
    {
      if (_txtfirstName.text.trim().isEmpty) {
          var uti = new Utils();
         uti.showMyDialog(context, "required", "YOUR MUST FILL ALL BOXES", "info", SingUpScreen(title: '',),);
    }
      else
    {
      var user = new User();
      user.firstName = _txtfirstName.text;
      user.lastName = _txtLastName.text;
      user.password = _txtPassword.text;
      user.Email = _txtEmail.text;
      user.username = _txtUserName.text;

      insertUser(user);

       // var uti =new Utils();
       // uti.showMyDialog(context, "success", "you registed successfully", "screen", HomePageScreen(title: ""), );

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
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: const Text('Sing-Up',
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
              height: 650,
              decoration: BoxDecoration(
                color: Color(0xFF253622),
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
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: _txtfirstName,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)
                      ),
                      hintText: 'First Name',
                        hintStyle: TextStyle(color: Colors.white)

                    ),
                  ),
                ),
                const SizedBox(height: 2),
                const Text(
                  "Last Name:",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                    width: 300,
                    child: TextField(
                      controller: _txtLastName,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)
                        ),
                        hintText: 'Last Name:',
                          hintStyle: TextStyle(color: Colors.white)

                      ),
                    )),
                const SizedBox(height: 2),
                const Text(
                  "UserName:",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                    width: 300,
                    child: TextField(
                      controller: _txtUserName,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)
                        ),
                        hintText: 'UserName',
                          hintStyle: TextStyle(color: Colors.white)

                      ),
                    )),
                const SizedBox(height: 2),
                const Text(
                  "Email:",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                    width: 300,
                    child: TextField(
                      controller: _txtEmail,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)
                        ),
                        hintText: 'Email',
                          hintStyle: TextStyle(color: Colors.white)

                      ),
                    )),
                const SizedBox(height: 2),
                const Text(
                  " Password:",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                    width: 300,
                    child: TextField(
                      obscureText: true,
                      controller: _txtPassword,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)
                        ),
                        hintText: 'Password',
                          hintStyle: TextStyle(color: Colors.white)

                      ),
                    )),
                const SizedBox(height: 2),
                const Text(
                  "Confirm Password:",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                    width: 300,
                    child: TextField(
                      obscureText: true,
                      controller: _txtComfirmPassword,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)
                        ),
                        hintText: 'Confirm Password:',
                          hintStyle: TextStyle(color: Colors.white)

                      ),
                    )),
                const SizedBox(height: 10),
                TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0xFF394d36)),
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
