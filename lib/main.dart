import 'package:flutter/material.dart';

void main() {
  runApp(BloodApp());
}

class BloodApp extends StatelessWidget {
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
