
import 'package:flutter/material.dart';
import 'package:null_message/null_message.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var initialized = false;

  @override
  void initState() {
    _init();
    super.initState();
  }

  void _init() async {
    try {
      await NullMessage.initialize();
      setState(() {
        initialized = true;
      });
    } on Exception catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text(
              initialized ? 'Plugin initialized' : 'Plugin not initialized'),
        ),
      ),
    );
  }
}
