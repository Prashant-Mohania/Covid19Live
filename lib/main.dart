import 'package:covid19live/datasource.dart';
import 'package:covid19live/screen/home.dart';
import 'package:flutter/material.dart';

main() {
  return runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Covid19 Live",
      home: Home(),
      theme: ThemeData(
        primaryColor: primaryBlack,
      ),
    );
  }
}
