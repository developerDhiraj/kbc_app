import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kbc_app_yt/services/localdb.dart';
import 'package:kbc_app_yt/views/home.dart';
import 'package:kbc_app_yt/views/login.dart';
import 'package:kbc_app_yt/views/loser.dart';
import 'package:kbc_app_yt/views/profile.dart';
import 'package:kbc_app_yt/views/question.dart';
import 'package:kbc_app_yt/views/win.dart';
import 'package:overlay_support/overlay_support.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLogIn = false;

  getLoggedInState() async {
    await LocalDB.getUserID().then((value) {
      setState(() {
        isLogIn = value.toString() != "null";
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getLoggedInState();
  }

  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'KBC Quiz',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: isLogIn ? Home() : Login(),
      ),
    );
  }
}
