import 'package:country_phone_codes/pages/countries_page.dart';
import 'package:country_phone_codes/pages/country_page_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const String route = "/";
  final String title;
  final TextEditingController _countryCode = TextEditingController();
  HomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 50,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: CupertinoTextField(
                  controller: _countryCode,
                  placeholder: "Country Code",
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 50,
              child: CupertinoButton(
                color: Colors.blue,
                child: const Text("Get Country"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CountryPageService(
                        countryCode: _countryCode.text,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 50,
              child: CupertinoButton(
                color: Colors.blue,
                child: const Text("Get All Countries"),
                onPressed: () {
                  Navigator.pushNamed(context, CountriesPage.route);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
