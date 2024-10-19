import 'package:flutter/material.dart';




class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key, required this.title});

  final String title;

  @override
  State<HomePageScreen> createState() => HomepagescreenPageState();
}

class HomepagescreenPageState extends State<HomePageScreen> {
  void _incrementCounter() {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page',
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
              width: 100,
              height:100,
              decoration: BoxDecoration(
                color: Colors.blueGrey.shade200,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey.shade900),

              ),
              onPressed: (){},
              child: const Text("play",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,),
              ),
            ),
          ],
        ),
      ),

    );
  }
}
