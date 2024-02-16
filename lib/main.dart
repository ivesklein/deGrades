import 'package:degrades/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.dark(primary: Color.fromRGBO(250, 125, 9, 1)),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}