import 'package:blood_bank/pages/profile_page.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Settings', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red[700],
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _buildSettingsSection(
                title: 'Account',
                children: [
                  _buildSettingsItem(
                    icon: Icons.person,
                    title: 'Edit Profile',
                    onTap: () => _navigateToEditProfile(context),
                  ),
                  _buildSettingsItem(
                    icon: Icons.password,
                    title: 'Change Password',
                    onTap: () => _navigateToChangePassword(context),
                  ),
                  _buildSettingsItem(
                    icon: Icons.medical_information,
                    title: 'Health Information',
                    onTap: () => _navigateToHealthInfo(context),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              _buildSettingsSection(
                title: 'Preferences',
                children: [
                  _buildSettingsItem(
                    icon: Icons.notifications,
                    title: 'Notifications',
                    onTap: () => _navigateToNotificationSettings(context),
                  ),
                  _buildSettingsItem(
                    icon: Icons.language,
                    title: 'Language',
                    trailing: const Text('English'),
                    onTap: () => _showLanguageDialog(context),
                  ),
                  _buildSettingsItem(
                    icon: Icons.dark_mode,
                    title: 'Dark Mode',
                    trailing: Switch(
                      value: false,
                      onChanged: (value) {},
                      activeColor: Colors.red,
                    ),
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(height: 24),
              _buildSettingsSection(
                title: 'More',
                children: [
                  _buildSettingsItem(
                    icon: Icons.help,
                    title: 'Help & Support',
                    onTap: () => _navigateToHelp(context),
                  ),
                  _buildSettingsItem(
                    icon: Icons.privacy_tip,
                    title: 'Privacy Policy',
                    onTap: () => _navigateToPrivacyPolicy(context),
                  ),
                  _buildSettingsItem(
                    icon: Icons.description,
                    title: 'Terms of Service',
                    onTap: () => _navigateToTerms(context),
                  ),
                  _buildSettingsItem(
                    icon: Icons.star,
                    title: 'Rate App',
                    onTap: () => _rateApp(context),
                  ),
                ],
              ),
              const SizedBox(height: 32),
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
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsSection({
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
          child: Column(children: children),
        ),
      ],
    );
  }

  Widget _buildSettingsItem({
    required IconData icon,
    required String title,
    Widget? trailing,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.red),
      title: Text(title),
      trailing: trailing ?? const Icon(Icons.chevron_right, color: Colors.grey),
      onTap: onTap,
    );
  }

  void _navigateToEditProfile(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const EditProfilePage()),
    );
  }

  void _navigateToChangePassword(BuildContext context) {
    // Implement navigation
  }

  void _navigateToHealthInfo(BuildContext context) {
    // Implement navigation
  }

  void _navigateToNotificationSettings(BuildContext context) {
    // Implement navigation
  }

  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text("Select Language"),
            content: SizedBox(
              width: double.maxFinite,
              child: ListView(
                shrinkWrap: true,
                children: [
                  ListTile(
                    title: const Text("English"),
                    trailing: const Icon(Icons.check, color: Colors.red),
                    onTap: () => Navigator.pop(context),
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text("বাংলা"),
                    onTap: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
          ),
    );
  }

  void _navigateToHelp(BuildContext context) {
    // Implement navigation
  }

  void _navigateToPrivacyPolicy(BuildContext context) {
    // Implement navigation
  }

  void _navigateToTerms(BuildContext context) {
    // Implement navigation
  }

  void _rateApp(BuildContext context) {
    // Implement rate app functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Redirecting to app store...")),
    );
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
