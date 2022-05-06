import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../model/country.dart';

class CountryPage extends StatelessWidget {
  const CountryPage({Key? key, required this.country}) : super(key: key);
  final Country country;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(country.name!),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80, bottom: 50.0),
            child: SizedBox(
              height: 150,
              width: 150,
              child: SvgPicture.memory(
                Uint8List.fromList(country.flag!),
              ),
            ),
          ),
          _row("Country Code :", country.id!),
          _row("Country Name :", country.name!),
          _row("Native Name :", country.nativeName!),
          _row("Phone Code :", country.phoneCode!.toString()),
          _row("Continent :", country.continent!),
          _row("Capital :", country.capital!),
          _row("Currency :", country.currency!),
          _row("Languages :", country.languages!.toString()),
        ],
      ),
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
