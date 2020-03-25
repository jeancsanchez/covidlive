import 'package:covidlive/http/api_client.dart';
import 'package:covidlive/http/models/country.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemsList extends StatelessWidget {
  final List<Country> countries = List();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Country>>(
        initialData: countries,
        future: findAllCountries(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;

            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());

            case ConnectionState.active:
              break;

            case ConnectionState.done:
              if (snapshot.data != null && snapshot.data.isNotEmpty) {
                countries.clear();
                countries.addAll(snapshot.data);
              }
              return ListView.builder(
                itemBuilder: (context, index) {
                  final country = countries[index];
                  return _ItemList(country: country);
                },
                itemCount: countries.length,
              );
              break;
          }

          return Text('Uknown error!');
        });
  }
}

class _ItemList extends StatelessWidget {
  final Country country;

  _ItemList({this.country});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(country.countryEnglishName),
        subtitle: Text(country.deadCount.toString()),
      ),
    );
  }
}
