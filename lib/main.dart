import 'package:flutter/material.dart';
import 'country.dart';
import 'service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Country Phone Codes'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<Country>> countriesFuture;

  @override
  void initState() {
    countriesFuture = RestfulServiceProvider.fetchCountries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Country> countries = [];
    //Read from server

    // FutureBuilder<List<Country>>(
    //   future: countriesFuture,
    //   builder: (context, snapshot) {
    //     if (snapshot.hasData) {
    //       countries.add(snapshot.data!);
    //     } else if (snapshot.hasError) {
    //       print('error!!');
    //       //return Text('${snapshot.error}');
    //     }

    //     // By default, show a loading spinner.
    //     return const CircularProgressIndicator();
    //   },
    // );

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
                return Column(
                  children: [
                    TextButton(
                      onPressed: () {
                        // Navigator.pop(context, e);
                      },
                      child: Row(
                        children: [
                          // SvgPicture.asset(
                          //   e.icon,
                          //   height: 25,
                          //   width: 25,
                          // ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              snapshot.data![index].name!,
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              '(+' +
                                  snapshot.data![index].phoneCode.toString() +
                                  ')',
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      height: 0,
                    ),
                  ],
                );
              },
              // children: countries.map((e) {
              //   return Column(
              //     children: [
              //       TextButton(
              //         onPressed: () {
              //           Navigator.pop(context, e);
              //         },
              //         child: Row(
              //           children: [
              //             // SvgPicture.asset(
              //             //   e.icon,
              //             //   height: 25,
              //             //   width: 25,
              //             // ),
              //             Padding(
              //               padding: const EdgeInsets.only(left: 20),
              //               child: Text(
              //                 e.name!,
              //                 style: const TextStyle(
              //                   color: Colors.black,
              //                 ),
              //               ),
              //             ),
              //             Padding(
              //               padding: const EdgeInsets.only(left: 20),
              //               child: Text(
              //                 '(+' + e.phoneCode.toString() + ')',
              //                 style: const TextStyle(
              //                   color: Colors.black,
              //                 ),
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //       const Divider(
              //         height: 0,
              //       ),
              //     ],
              //   );
              // }).toList(),
            );
          } else {
            return const Center(
              child: Text('No Data Fetched!'),
            );
          }
        }),
      ),
    );
  }
}
