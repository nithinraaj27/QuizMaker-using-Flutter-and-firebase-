import 'package:flutter/material.dart';
import 'package:flutter_quiz_maker/helper/functions.dart';
import 'package:flutter_quiz_maker/views/home.dart';
import 'package:flutter_quiz_maker/views/signin.dart';
import 'package:flutter_quiz_maker/views/signup.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool _isLoggedin = false;
  @override
  void initState() {
    checkUserLoggedInStatus();
    // TODO: implement initState
    super.initState();
  }

  checkUserLoggedInStatus() async {
    HelperFunctions.getUserLoggedInDetails().then((value){
      setState(() {
        _isLoggedin = value;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Quiz Maker",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: (_isLoggedin ?? false)? Home(): signin(),
    );
  }
}
