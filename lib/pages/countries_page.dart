import 'dart:typed_data';

import 'package:country_phone_codes/pages/country_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../model/country.dart';
import '../service.dart';

class CountriesPage extends StatefulWidget {
  const CountriesPage({Key? key, required this.title}) : super(key: key);

  static const String route = "countries";

  final String title;

  @override
  State<CountriesPage> createState() => _CountriesPageState();
}

class _CountriesPageState extends State<CountriesPage> {
  Future<List<Country>>? countriesFuture;

  @override
  void initState() {
    super.initState();
    countriesFuture = RestfulServiceProvider.fetchCountries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<Country>>(
        future: countriesFuture,
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return TextButton(
                  child: ListTile(
                    leading: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: SizedBox(
                        height: 30,
                        width: 30,
                        child: SvgPicture.memory(
                          Uint8List.fromList(snapshot.data![index].flag!),
                        ),
                      ),
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        snapshot.data![index].name!,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CountryPage(country: snapshot.data![index]),
                      ),
                    );
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('${snapshot.error}'));
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        }),
      ),
    );
  }
}
