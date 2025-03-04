
import 'package:flutter/material.dart';

class Utils{
  get screen => null;


  // type=screen;info;
  Future<void> showMyDialog(context,title,content, type, Widget sceren) async{
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content:  SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(content),

              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text("ok"),
              onPressed: () {
                if(type == "screen")
                  {
                    Navigator.of(context).pop();

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                            screen), );
                  }
                else
                  {
                    Navigator.of(context).pop();
                  }

              },


            ),
          ],
        );
      },
    );
  }
  Future<void> showMyDialog2(context,title,content) async{
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content:  SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(content),

              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text("ok"),
              onPressed: () {

                  Navigator.of(context).pop();
                }


            ),
          ],
        );
      },
    );
  }
}

