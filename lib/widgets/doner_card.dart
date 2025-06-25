import 'package:flutter/material.dart';

class DonorCard extends StatelessWidget {
  final DonorModel donor;

  const DonorCard({required this.donor});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 4,
      child: ListTile(
        leading: CircleAvatar(
          child: Text(donor.bloodGroup),
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
        ),
        title: Text(donor.name),
        subtitle: Text('Location: ${donor.location}'),
      ),
    );
  }
}
