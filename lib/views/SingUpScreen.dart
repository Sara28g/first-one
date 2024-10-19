import 'package:flutter/material.dart';




class SingUpScreen extends StatefulWidget {
  const SingUpScreen({super.key, required this.title});

  final String title;

  @override
  State<SingUpScreen> createState() => SingUpScreenPageState();
}

class SingUpScreenPageState extends State<SingUpScreen> {
  void _incrementCounter() {
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
         height: 625,
         decoration: BoxDecoration(
           color: Colors.blueGrey.shade200,
           shape: BoxShape.rectangle,
           borderRadius: BorderRadius.circular(20),
         ),
       ),
        Column(
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
         SizedBox(height: 2),

         Text(
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
             decoration: InputDecoration(
               border: OutlineInputBorder(),
               hintText: 'Last Name:',
             ),
           )),
        SizedBox(height: 2),

        Text(
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
             decoration: InputDecoration(
               border: OutlineInputBorder(),
               hintText: 'UserName/Email',
             ),
           )),
       SizedBox(height: 2),

       Text(
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
             decoration: InputDecoration(
               border: OutlineInputBorder(),
               hintText: 'Email',
             ),
           )),
       SizedBox(height: 2),

       Text(
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
             decoration: InputDecoration(
               border: OutlineInputBorder(),
               hintText: 'Password',
             ),
           )),
       SizedBox(height: 2),

       Text(
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
             decoration: InputDecoration(
               border: OutlineInputBorder(),
               hintText: 'Confirm Password:',
             ),
           )),
         const SizedBox(height: 10),


         TextButton(
         style: ButtonStyle(
           foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
           backgroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey.shade900),

         ),
         onPressed: (){},
         child: Text(" create",
           style: TextStyle(
             color: Colors.white,
             fontSize: 15,),
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
