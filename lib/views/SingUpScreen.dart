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
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;


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
      backgroundColor: Color(0xFF253021),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.0),
          key: _formKey,
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                SizedBox(height: 10),

                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color:  Colors.white,
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
                        keyboardType: TextInputType.multiline,
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
                          }
                          else if (value != _txtPassword) {
                            return "please write the same password";
                          };
                          return null;
                        },
                          ),

                      SizedBox(height: 30),


                      ElevatedButton(
                        onPressed: () {
                             if (_formKey.currentState!.validate()) {
                               _login();
                               Navigator.push(
                                 context,
                                 MaterialPageRoute(
                                     builder: (context) =>
                                     const HomePageScreen(title: "Create")),

                               );
                             }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 64),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),),
                          foregroundColor:Colors.white,
                          backgroundColor:Color(0xFFD4DED1),
                        ),
                        child: const Text(
                          'Create',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),

                      SizedBox(height: 20),

                      TextButton(
                        onPressed: () {
                        },
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(color:  Color(0xFF253021)),
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
    );
    // Replace with actual login logic
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Login Successful!")),
    );
  }

      /*
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

                ),
              ],
            )
          ],
        ),
      ),

       */

  }



