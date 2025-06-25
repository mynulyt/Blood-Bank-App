import 'package:flutter/material.dart';

class MyRequestsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Requests")),
      body: Center(child: Text("No requests yet.")),
    );
  }
}
