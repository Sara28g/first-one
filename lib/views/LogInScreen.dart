import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:email_auth/email_auth.dart';
import 'package:first_one/Utils/db.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Utils/client.dart';
import '../models/CheckloginModel.dart';
import 'HomePageScreen.dart';
import 'SingUpScreen.dart';
import 'package:http/http.dart' as http;

class LogInScreen extends StatefulWidget {
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  // final _userID = TextEditingController();
  // final _txtUserName = TextEditingController();
  // final _txtfirstName = TextEditingController();
  // final _txtLastName = TextEditingController();
  final _txtEmail = TextEditingController();
  final _txtPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();

  bool _isPasswordVisible = false;
  final _otpContoler = TextEditingController();
  bool _isLoading = false;


  fillSavedPars()
  async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _txtEmail.text = prefs.get("Email").toString();
    _txtPassword.text = prefs.get("password").toString();
    if(_txtEmail.text != "" && _txtPassword.text != "")
    {
       checklogin(context);
    }
  }



  // Updated checkLogin implementation with SnackBar instead of Utils
  Future <void> checklogin(BuildContext context) async {
    setState(() {
      _isLoading = true;
    });

    try {
      if (_txtPassword.text != "" && _txtEmail.text != "") {
        var url = "login/checklogin.php?email=${_txtEmail.text}&password=${_txtPassword.text}";
        final response = await http.get(Uri.parse(serverPath + url));

        print(response);
        print(serverPath + url);

        if (checkloginModel.fromJson(jsonDecode(response.body)).userID == 0) {
          print("SharedPreferences 0");
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Invalid email or password. Please try again.'),
              backgroundColor: Colors.red,
              duration: Duration(seconds: 3),
            ),
          );
        } else {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('Email', _txtEmail.text);
          await prefs.setString('password', _txtPassword.text);
          await prefs.setInt('userID', checkloginModel.fromJson(jsonDecode(response.body)).userID!);
          await prefs.setString('fullName', checkloginModel.fromJson(jsonDecode(response.body)).fullName!);

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Login successful!'),
              backgroundColor: Colors.green,
              duration: Duration(seconds: 2),
            ),
          );

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePageScreen(title: "Home")),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('You should fill in email and password'),
            backgroundColor: Colors.orange,
            duration: Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
      print("Error during login: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred: $e'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }



  @override
  Widget build(BuildContext context) {

    fillSavedPars();


    return Scaffold(
      backgroundColor: Color(0xFF253021),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    " Welcome Back",
                    style: TextStyle(
                      fontFamily: HttpHeaders.acceptCharsetHeader,
                      color: Colors.white,
                      fontSize: 40,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
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
                        controller: _txtEmail,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          prefixIcon: Icon(Icons.email),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          } else if (!(isValidEmail(value))) {
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
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          ),
                        ),
                        obscureText: !_isPasswordVisible,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      _isLoading
                          ? CircularProgressIndicator(color: Color(0xFF253021))
                          : ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  // Hide keyboard
                                  FocusScope.of(context).unfocus();
                                  checklogin(context);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 64),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                foregroundColor: Colors.white,
                                backgroundColor: Color(0xFF253021),
                              ),
                              child: const Text(
                                'Log In',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              _showForgotPasswordModal(context);
                            },
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(color: Color(0xFF253021)),
                            ),
                          ),
                          SizedBox(width: 20),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SingUpScreen(title: "")),
                              );
                            },
                            child: const Text(
                              'New Account',
                              style: TextStyle(color: Color(0xFF253021)),
                            ),
                          ),
                        ],
                      ),
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

  void _showForgotPasswordModal(BuildContext context) {
    final _forgotEmailController = TextEditingController();
    bool _isProcessing = false;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              left: 16,
              right: 16,
              top: 16,
            ),
            child: Form(
              key: _formKey2,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Forgot Password",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _forgotEmailController,
                    decoration: InputDecoration(
                      labelText: 'Enter your email',
                      hintText: 'We\'ll send you a password reset link',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      prefixIcon: Icon(Icons.email),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      } else if (!(isValidEmail(value))) {
                        return "Please enter a valid email";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  _isProcessing
                      ? CircularProgressIndicator(color: Color(0xFF253021))
                      : ElevatedButton(
                          onPressed: () async {
                            if (_formKey2.currentState!.validate()) {
                              setState(() {
                                _isProcessing = true;
                              });

                              // Simulate API call
                              await Future.delayed(Duration(seconds: 2));

                              setState(() {
                                _isProcessing = false;
                              });

                              Navigator.pop(context); // Close the modal
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      "Password reset link sent to ${_forgotEmailController.text}"),
                                  backgroundColor: Colors.black,
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 40),
                            backgroundColor: Color(0xFF253021),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            "Send Reset Link",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          );
        });
      },
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
