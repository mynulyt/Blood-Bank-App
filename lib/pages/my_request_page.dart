import 'package:flutter/material.dart';

class MyRequestsPage extends StatelessWidget {
  const MyRequestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Requests")),
      body: Center(child: Text("No requests yet.")),
    );
  }
}
