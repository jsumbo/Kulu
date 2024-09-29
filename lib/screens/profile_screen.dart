import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/profile_placeholder.png'),
          ),
          SizedBox(height: 20),
          Text(
            'John Doe',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'Language Enthusiast',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          SizedBox(height: 20),
          _buildProgressSection(),
          SizedBox(height: 20),
          _buildSettingsSection(context),
        ],
      ),
    );
  }

  Widget _buildProgressSection() {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Learning Progress',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildProgressBar('Swahili', 0.7),
            SizedBox(height: 5),
            _buildProgressBar('Zulu', 0.4),
            SizedBox(height: 5),
            _buildProgressBar('Koloqua', 0.2),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressBar(String language, double progress) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(language),
        SizedBox(height: 5),
        LinearProgressIndicator(
          value: progress,
          backgroundColor: Colors.grey[300],
        ),
      ],
    );
  }

  Widget _buildSettingsSection(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notifications'),
            trailing: Switch(
              value: true,
              onChanged: (bool value) {
                // TODO: Implement notification settings
              },
            ),
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: Text('App Language'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // TODO: Implement app language settings
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Log Out'),
            onTap: () {
              // TODO: Implement log out functionality
              Navigator.pushReplacementNamed(context, '/auth');
            },
          ),
        ],
      ),
    );
  }
}