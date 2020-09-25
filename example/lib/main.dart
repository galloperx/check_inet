import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:check_inet/check_inet.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  bool _internetActive = false;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    bool internetActive;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      //platformVersion = await CheckInet.platformVersion;
      internetActive = await CheckInet.checkInternet;
    } on Exception catch(_ee){
      //platformVersion = 'Failed to check Internet.';
      internetActive = false;
      print(_ee);
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      //_platformVersion = platformVersion;
      _internetActive = internetActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: _internetActive ? Text('Internet is ACTIVE!') : CircularProgressIndicator(),
        ),
      ),
    );
  }
}
