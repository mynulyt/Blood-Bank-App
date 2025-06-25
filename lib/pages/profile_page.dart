import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('My Profile', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red[700],
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => _navigateToEditProfile(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),
            // Profile Header
            Column(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  child: Icon(Icons.person, size: 50),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Mynul Alam',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  'Active donor since 2021',
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildStatItem('12', 'Donations'),
                    const SizedBox(width: 24),
                    _buildStatItem('A+', 'Blood Group'),
                    const SizedBox(width: 24),
                    _buildStatItem('4', 'Saves'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),
            // Profile Sections
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  _buildProfileSection(
                    title: 'Personal Information',
                    children: [
                      _buildProfileItem(
                        Icons.email,
                        'Email',
                        'mynul@example.com',
                      ),
                      _buildProfileItem(Icons.phone, 'Phone', '+8801712345678'),
                      _buildProfileItem(
                        Icons.location_on,
                        'Address',
                        '123 Main St, Dhaka',
                      ),
                      _buildProfileItem(
                        Icons.cake,
                        'Date of Birth',
                        'January 15, 1990',
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  _buildProfileSection(
                    title: 'Medical Information',
                    children: [
                      _buildProfileItem(Icons.bloodtype, 'Blood Group', 'A+'),
                      _buildProfileItem(
                        Icons.medical_services,
                        'Last Donation',
                        '3 months ago',
                      ),
                      _buildProfileItem(
                        Icons.health_and_safety,
                        'Health Conditions',
                        'None',
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  _buildProfileSection(
                    title: 'Settings',
                    children: [
                      _buildProfileActionItem(
                        Icons.notifications,
                        'Notification Settings',
                        onTap: () => _navigateToNotificationSettings(context),
                      ),
                      _buildProfileActionItem(
                        Icons.security,
                        'Privacy Settings',
                        onTap: () => _navigateToPrivacySettings(context),
                      ),
                      _buildProfileActionItem(
                        Icons.help,
                        'Help & Support',
                        onTap: () => _navigateToHelp(context),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () => _showLogoutConfirmation(context),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.red),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'LOGOUT',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
        Text(label, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
      ],
    );
  }

  Widget _buildProfileSection({
    required String title,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Card(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: children),
          ),
        ),
      ],
    );
  }

  Widget _buildProfileItem(IconData icon, String label, String value) {
    return ListTile(
      leading: Icon(icon, color: Colors.red),
      title: Text(label),
      subtitle: Text(value),
      contentPadding: EdgeInsets.zero,
      minLeadingWidth: 24,
    );
  }

  Widget _buildProfileActionItem(
    IconData icon,
    String label, {
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.red),
      title: Text(label),
      trailing: const Icon(Icons.chevron_right),
      contentPadding: EdgeInsets.zero,
      minLeadingWidth: 24,
      onTap: onTap,
    );
  }

  void _navigateToEditProfile(BuildContext context) {
    // Implement navigation to edit profile
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const EditProfilePage()),
    );
  }

  void _navigateToNotificationSettings(BuildContext context) {
    // Implement navigation to notification settings
  }

  void _navigateToPrivacySettings(BuildContext context) {
    // Implement navigation to privacy settings
  }

  void _navigateToHelp(BuildContext context) {
    // Implement navigation to help & support
  }

  void _showLogoutConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text("Logout"),
            content: const Text("Are you sure you want to logout?"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  Navigator.pop(context);
                  // Implement logout functionality
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Logged out successfully")),
                  );
                },
                child: const Text(
                  "Logout",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
    );
  }
}

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profile')),
      body: const Center(child: Text('Edit Profile Page')),
    );
  }
}
