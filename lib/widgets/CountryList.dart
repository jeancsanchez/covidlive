import 'package:covidlive/data/Repository.dart';
import 'package:covidlive/models/Country.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CountryList extends StatelessWidget {
  final List<Country> countries = List();
  final repository = Repository();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Country>>(
        initialData: countries,
        future: repository.findAll(),
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
        leading: SvgPicture.network(
          country.flag,
          placeholderBuilder: (context) => Icon(Icons.flag),
          height: 30,
        ),
        title: Text(country.name),
        subtitle: Text('Total: ${country.cases} casos\n'
            'Recuperados: ${country.recovered}\n'
            'Hoje: +${country.deltaCases} casos'),
        trailing: Text(
          'Mortes: ${country.deaths}',
          style: TextStyle(color: Colors.redAccent),
        ),
      ),
    );
  }
}
