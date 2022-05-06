import 'dart:convert';

import 'package:country_phone_codes/model/country.dart';
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
      throw Exception("There is no data to fetch!");
    }
  }

  static Future<List<Country>> fetchCountry(String id) async {
    List jsonResponse = [];
    String url = 'http://localhost:8080/countries?countryCode=' + id;
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      jsonResponse = json.decode(response.body);
      return jsonResponse.map((country) => Country.fromJson(country)).toList();
    } else {
      throw Exception("There is no data to fetch!");
    }
  }
}
