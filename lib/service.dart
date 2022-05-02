import 'dart:convert';

import 'package:country_phone_codes/country.dart';
import 'package:http/http.dart' as http;

class RestfulServiceProvider {
  static Future<List<Country>> fetchCountries() async {
    List jsonResponse = [];
    final response =
        await http.get(Uri.parse('http://localhost:8080/countries'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      jsonResponse = json.decode(response.body);
      return jsonResponse.map((country) => Country.fromJson(country)).toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load countries');
    }
  }
}
