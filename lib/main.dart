import 'package:flutter/material.dart';
import 'package:worldtime/pages/loading.dart';
import 'package:worldtime/pages/home.dart';
import 'package:worldtime/pages/choose_location.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      useMaterial3: true,
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => const Loading(),
      '/home': (context) => const Home(),
      '/location': (context) => const ChooseLocation(),
    },
  ));
}
