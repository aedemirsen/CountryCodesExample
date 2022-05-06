import 'package:country_phone_codes/pages/countries_page.dart';
import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        HomePage.route: (context) => HomePage(
              title: "Countries",
            ),
        CountriesPage.route: (context) => const CountriesPage(
              title: "Countries",
            ),
      },
    );
  }
}
