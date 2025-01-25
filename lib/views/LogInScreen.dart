import 'dart:io';
import 'package:email_auth/email_auth.dart';
import 'package:first_one/Utils/db.dart';
import 'package:flutter/material.dart';
import 'HomePageScreen.dart';
import 'SingUpScreen.dart';

class LogInScreen extends StatefulWidget {
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _txtEmail = TextEditingController();
  final _txtPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();

  bool accountValid()
  {
    return (checkLogIn(_txtEmail.text, _txtPassword.text) != null);
  }
  bool _isPasswordVisible = false;
  final _otpContoler = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                          //else if(value != _txtPassword){
                          //  return 'incorrect password';
                          //  }
                          else
                            return null;
                        },
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate() && accountValid()) {
                            _login();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const HomePageScreen(title: "Log In")),
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
                          'Log In',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextButton(
                        onPressed: () {
                          _showForgotPasswordModal(context);
                        },
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(color: Color(0xFF253021)),
                        ),
                      ),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }





  void _login() {
    // Replace with actual login logic
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Login Successful!")),
    );
  }

  void _showForgotPasswordModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(16.0),
          //key: _formKey2,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Forgot Password",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Enter your email',
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
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()  ) {

                      Navigator.pop(context); // Close the modal
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Password reset link sent!")),
                      );
                  }
                },
                child: Text("Submit"),
              ),
            ],
          ),
        );
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