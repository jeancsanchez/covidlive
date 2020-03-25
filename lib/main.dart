import 'package:covidlive/ItemsList.dart';
import 'package:covidlive/http/api_client.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text('Covid Live'),
            backgroundColor: Colors.redAccent,
          ),
          body: ItemsList()),
    );
  }
}
