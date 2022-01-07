import 'package:flutter/material.dart';
import 'package:flutter_qr_reader/pages/home_page.dart';
import 'package:flutter_qr_reader/pages/map_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QR Reader',
      initialRoute: 'home',
      routes: {
        'home': (_) => const HomePage(),
        'map': (_) => const MapPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.deepPurple,
        ),
      ),
    );
  }
}
