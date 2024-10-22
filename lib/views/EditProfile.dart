import 'package:flutter/material.dart';




class EditProfile extends StatefulWidget {
  const EditProfile({super.key, required this.title});

  final String title;

  @override
  State<EditProfile> createState() => EditProfilePageState();
}

class EditProfilePageState extends State<EditProfile> {
  void _incrementCounter() {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile',
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
              height: 625,
              decoration: BoxDecoration(
                color: Colors.blueGrey.shade200,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            const Column(
              mainAxisSize: MainAxisSize.min,
              children:<Widget> [
                SizedBox(height: 10),
                Text(
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
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'First Name',
                      ),
                    )),

                SizedBox(height: 10),



              ],
            )
          ],
        ),
      ),

    );
  }
}
