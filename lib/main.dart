import 'package:blood_bank/pages/slash_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blood Management',
      theme: ThemeData(
        primarySwatch: Colors.red,
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Poppins'),
      ),
      home: SplashScreen(),
    );
  }
}
