import 'package:covidlive/http/models/country.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

Resource<List<Model>> get all {
  return Resource(
      url: 'https://pomber.github.io/covid19/timeseries.json',
      parse: (response) {
        var json;
        final result = json.decode(response.body);
        Iterable list = result;
        return list.map((model) => Model.fromJson(model)).toList();
      });
}

class Resource<T> {
  final String url;
  T Function(Response response) parse;

  Resource({this.url, this.parse});
}

class Webservice {
  Future<T> load<T>(Resource<T> resource) async {
    final response = await http.get(resource.url);
    if (response.statusCode == 200) {
      return resource.parse(response);
    } else {
      throw Exception('Failed to load data!');
    }
  }
}
