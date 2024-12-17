
import 'package:first_one/views/SplashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(), // Set SplashScreen as the first screen
    );
  }
}

                  /*
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

 */
