import 'package:blood_bank/pages/donar_list_page.dart';
import 'package:blood_bank/pages/my_request_page.dart';
import 'package:blood_bank/pages/notification_page.dart';
import 'package:flutter/material.dart';
import 'request_blood_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          "LifeBlood Dashboard",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red[700],
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            // Header with stats
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.red[50],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.red[100]!),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStatItem("120+", "Donors", Icons.people),
                  _buildStatItem("45", "Requests", Icons.bloodtype),
                  _buildStatItem("12", "Today", Icons.calendar_today),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Main action buttons
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                children: [
                  _buildActionCard(
                    context,
                    icon: Icons.search,
                    title: "Find Donor",
                    color: Colors.blue,
                    page: DonorListPage(),
                  ),
                  _buildActionCard(
                    context,
                    icon: Icons.bloodtype,
                    title: "Request Blood",
                    color: Colors.red,
                    page: RequestBloodPage(),
                  ),
                  _buildActionCard(
                    context,
                    icon: Icons.list_alt,
                    title: "My Requests",
                    color: Colors.green,
                    page: MyRequestsPage(),
                  ),
                  _buildActionCard(
                    context,
                    icon: Icons.notifications,
                    title: "Notifications",
                    color: Colors.orange,
                    page: NotificationPage(), // Replace with actual page
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // Bottom navigation
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String label, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Colors.red, size: 28),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }

  Widget _buildActionCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required Color color,
    required Widget page,
  }) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap:
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => page),
            ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: color, size: 30),
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
