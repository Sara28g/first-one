import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

void main() {
  runApp( MyApp());
}
//sara

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('log-in',style: TextStyle(color:Colors.white,fontSize: 30,)),

        backgroundColor: Colors.blueGrey.shade800,

      ),
      body: Center(
        child: SquareText(),
      ),
    );

  }
}
class SquareText extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      width:350,
      height: 300,
      decoration: BoxDecoration(color: Colors.blueGrey.shade200,
        shape:
        BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            const Text("UserName or Email:",style: TextStyle(color:Colors.black,fontSize: 20,),textAlign: TextAlign.left , ),
            const SizedBox(width:300,
                child:TextField(
                  decoration: InputDecoration(border: OutlineInputBorder(),hintText: 'UserName/Email',),

                )
            ),
            const Text("password:",style: TextStyle(color:Colors.black,fontSize: 20,),textAlign: TextAlign.left , ),
            const SizedBox(width:300,
                child:TextField(
                  decoration: InputDecoration(border: OutlineInputBorder(),hintText: 'password',),
                )
            ),

          ],
        ),
      ),
    );

  }
}



