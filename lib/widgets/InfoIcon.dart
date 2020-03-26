import 'package:flutter/material.dart';

class InfoIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.info_outline),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext ctx) {
                return AlertDialog(
                  title: Text('Info'),
                  content: Text(
                    'Developed by Jean from github.com/jeancsanchez\n\n'
                    'Icon made by Freepik from flaticon.com\n\n'
                    'Data updates from covidvisualizer.com',
                    style: TextStyle(fontSize: 20),
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('Ok'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              });
        });
  }
}
