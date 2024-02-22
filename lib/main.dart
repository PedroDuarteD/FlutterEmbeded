import 'package:flutter/material.dart';
import 'package:flutter_web_embedded/screens/MainPage.dart';

void main() {
  runApp( MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    ),
    home:  MyHomePage(),
  ));
}




