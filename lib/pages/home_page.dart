import 'package:flutter/material.dart';

import 'request_blood_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dashboard")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => DonorListPage()),
                ),
            child: Text("Find Donor"),
          ),
          ElevatedButton(
            onPressed:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => RequestBloodPage()),
                ),
            child: Text("Request Blood"),
          ),
          ElevatedButton(
            onPressed:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => MyRequestsPage()),
                ),
            child: Text("My Requests"),
          ),
        ],
      ),
    );
  }
}
