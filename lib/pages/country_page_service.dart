import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../model/country.dart';
import '../service.dart';

class CountryPageService extends StatelessWidget {
  CountryPageService({Key? key, required this.countryCode}) : super(key: key);
  final String countryCode;
  Future<List<Country>>? countriesFuture;
  @override
  Widget build(BuildContext context) {
    countriesFuture = RestfulServiceProvider.fetchCountry(countryCode);
    return FutureBuilder<List<Country>>(
      future: countriesFuture,
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          var data = snapshot.data!.first;
          return Scaffold(
            appBar: AppBar(
              title: Text(data.name!),
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 80, bottom: 50.0),
                  child: SizedBox(
                    height: 150,
                    width: 150,
                    child: SvgPicture.memory(
                      Uint8List.fromList(data.flag!),
                    ),
                  ),
                ),
                _row("Country Code :", data.id!),
                _row("Country Name :", data.name!),
                _row("Native Name :", data.nativeName!),
                _row("Phone Code :", data.phoneCode!.toString()),
                _row("Continent :", data.continent!),
                _row("Capital :", data.capital!),
                _row("Currency :", data.currency!),
                _row("Languages :", data.languages!.toString()),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('${snapshot.error}'));
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }

  _row(String title, String data) {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(data),
          ),
        ],
      ),
    );
  }
}
