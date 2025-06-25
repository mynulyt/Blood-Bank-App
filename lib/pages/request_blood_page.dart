import 'package:flutter/material.dart';

class RequestBloodPage extends StatelessWidget {
  final nameController = TextEditingController();
  final groupController = TextEditingController();
  final locationController = TextEditingController();

  RequestBloodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Request Blood")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Patient Name'),
            ),
            TextField(
              controller: groupController,
              decoration: InputDecoration(labelText: 'Blood Group'),
            ),
            TextField(
              controller: locationController,
              decoration: InputDecoration(labelText: 'Location'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed:
                  () => ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text("Request Submitted!"))),
              child: Text("Submit Request"),
            ),
          ],
        ),
      ),
    );
  }
}
