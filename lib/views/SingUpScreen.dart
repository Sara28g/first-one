import 'package:first_one/Utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:first_one/Utils/db.dart';
import '../Utils/client.dart';
import '../models/UserModel.dart';
import 'HomePageScreen.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

Future insertUser(BuildContext context, User us) async {

  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //  String? getInfoDeviceSTR = prefs.getString("getInfoDeviceSTR");
  var url = "users/insertUser.php?firstName=" + us.firstName + "&lastName=" + us.lastName;
  final response = await http.get(Uri.parse(serverPath + url));
  print(serverPath + url);
  //setState(() { });
  Navigator.pop(context);
}


class SingUpScreen extends StatefulWidget {
  const SingUpScreen({super.key, required this.title});

  final String title;

  @override
  State<SingUpScreen> createState() => SingUpScreenPageState();
}

class SingUpScreenPageState extends State<SingUpScreen> {
  void _incrementCounter() {}
  final _txtUserName = TextEditingController();
  final _txtfirstName = TextEditingController();
  final _txtLastName = TextEditingController();
  final _txtEmail = TextEditingController();
  final _txtPassword = TextEditingController();
  final _formKey2 = GlobalKey<FormState>();

  void insertUserFunc() {
    var user = new User();
    user.firstName = _txtfirstName.text;
    user.lastName = _txtLastName.text;
    user.password = _txtPassword.text;
    user.Email = _txtEmail.text;
    user.username = _txtUserName.text;

    insertUser(context, user);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF253021),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.0),
          child: Form(
            key: _formKey2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _txtfirstName,
                        decoration: InputDecoration(
                          labelText: 'First Name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your first name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _txtLastName,
                        decoration: InputDecoration(
                          labelText: 'Last Name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your last name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _txtUserName,
                        decoration: InputDecoration(
                          labelText: 'UserName',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your userName';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _txtEmail,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          else if (!(isValidEmail(value)))
                          {
                           return "Please enter a valid email";
                          }

                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _txtPassword,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm password';
                          } else if (value != _txtPassword.text) {
                            return "please write the same password";
                          }
                          ;
                          return null;
                        },
                      ),
                      SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey2.currentState!.validate()) {
                            _singup();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const HomePageScreen(title: "Create")),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 64),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          foregroundColor: Colors.white,
                          backgroundColor: Color(0xFFD4DED1),
                        ),
                        child: const Text(
                          'Create',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _singup() {
    insertUserFunc();
    // Replace with actual login logic
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("new account created")),
    );
  }
}

bool isValidEmail(String email) {
  // Define the email validation RegExp
  final RegExp emailRegex = RegExp(
    r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
  );

  // Return whether the input matches the RegExp
  return emailRegex.hasMatch(email);
}