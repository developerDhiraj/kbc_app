import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:kbc_app_yt/services/auth.dart';
import 'package:kbc_app_yt/services/internetCon.dart';
import 'package:kbc_app_yt/views/home.dart';
import 'package:overlay_support/overlay_support.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    // TODO: implement initState
    InternetConnectionChecker.instance.onStatusChange.listen((status) {
      final connected = status == InternetConnectionStatus.connected;
      showSimpleNotification(
        Text(connected ? "Connected to Internet" : "No Internet"),
        background: connected ? Colors.green : Colors.red,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/kbc_logo.jpg"),
            SizedBox(height: 20),
            Text(
              "Welcome \n To KBC Quiz App",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            SignInButton(
              Buttons.GoogleDark,
              onPressed: () async {
                await signWithGoogle();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
            ),
            SizedBox(height: 10),
            Text("By continuing, You are agreeing with our TnC"),
          ],
        ),
      ),
    );
  }
}
