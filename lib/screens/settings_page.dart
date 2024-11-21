import 'package:flutter/material.dart';
import 'edit_profile_page.dart'; 

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  Widget _buildListTile({
    required String title,
    required IconData icon,
    bool showDivider = true,
    bool showArrow = true,
    VoidCallback? onTap,
  }) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, size: 24, color: Colors.black),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: showArrow
              ? const Icon(Icons.chevron_right, color: Colors.black)
              : null,
          onTap: onTap,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        ),
        if (showDivider)
          const Divider(height: 1, thickness: 0.5, indent: 20, endIndent: 20),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          _buildListTile(
            title: 'Edit Profile',
            icon: Icons.person,
            onTap: () {
              // Navigate to Edit Profile Page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditProfilePage()),
              );
            },
          ),
          // Add more list tiles for other settings options here
        ],
      ),
    );
  }
}