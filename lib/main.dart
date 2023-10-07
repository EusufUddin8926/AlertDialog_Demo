import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blueGrey),
    );
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: Colors.green,
      elevation: 6,
      shadowColor: Colors.black,
      padding: EdgeInsets.fromLTRB(32, 12, 32, 12),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4))));

  SnakbarMsg(String msg, context) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(msg)));
  }

  MyAlertDialog(context) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return Expanded(
              child: AlertDialog(
               title: Text("Logout !"),
                content: Text("Do you want to logout?"),
               actions: [
                 TextButton(
                  onPressed: () {
                    SnakbarMsg("Cancel Successfully", context);
                    Navigator.of(context).pop(context);
                  },
                  child: Text("Cancel")),
                 TextButton(
                  onPressed: () {
                    SnakbarMsg("Logout Successfully", context);
                    Navigator.of(context).pop(context);
                  },
                  child: Text("Ok"))
            ],
          ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alert Dialog Demo"),
      ),
      body: Center(
        child: ElevatedButton(
            child: Text("Logout"),
            style: buttonStyle,
            onPressed: () {
              MyAlertDialog(context);
            }),
      ),
    );
  }
}
