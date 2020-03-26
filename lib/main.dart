import 'package:covid19live/widgets/CountryList.dart';
import 'package:covid19live/widgets/InfoIcon.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text('Covid Live'),
            backgroundColor: Colors.redAccent,
            actions: <Widget>[InfoIcon()],
          ),
          body: CountryList()),
    );
  }
}
