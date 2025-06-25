import 'package:blood_bank/models/donar_model.dart';
import 'package:blood_bank/widgets/doner_card.dart';
import 'package:flutter/material.dart';

class DonorListPage extends StatelessWidget {
  final List<DonorModel> donors = [
    DonorModel(name: 'Rafi', bloodGroup: 'A+', location: 'Dhaka'),
    DonorModel(name: 'Samiha', bloodGroup: 'O-', location: 'Chittagong'),
  ];

  DonorListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Available Donors")),
      body: ListView.builder(
        itemCount: donors.length,
        itemBuilder: (context, index) {
          return DonorCard(donor: donors[index]);
        },
      ),
    );
  }
}
