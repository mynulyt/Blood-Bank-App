import 'package:blood_bank/pages/donar_list_page.dart';
import 'package:blood_bank/pages/my_request_page.dart';
import 'package:flutter/material.dart';

import 'request_blood_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
