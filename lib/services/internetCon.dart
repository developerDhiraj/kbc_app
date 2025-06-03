import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:overlay_support/overlay_support.dart';

class Internet {
  bool connected = false;

  Future<void> checkInternetCon(BuildContext context) async {
    connected = await InternetConnectionChecker.instance.hasConnection;

    final msg =
        connected ? "Connected to Internet" : "Not Connected to Internet";

    showSimpleNotification(
      Text(msg),
      background: connected ? Colors.green : Colors.red,
    );
  }
}
