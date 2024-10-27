import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart' // might remove if compile error exists
import 'settings_page.dart'; 

class ProverbsPoetryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Ancient Voices, Timeless Words: Dive Into Proverbs & Poetry',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSection(
              image: 'assets/african_mask.jpg',
              title: 'Tinndi e Jime',
              description:
                  'Step into the world of wise sayings and soulful Fulani poetry',
            ),
            _divider(),
            _buildSection(
              image: 'assets/african.jpg',
              title: 'Methali na Mashairi',
              description:
                  'Embark on a journey through timeless wisdom and lyrical Swahili verses!',
            ),
            _divider(),
            _buildSection(
              image: 'assets/izoga.jpg',
              title: 'Izaga nezinkondlo',
              description:
                  'Feel the heartbeat of Africa with powerful Zulu proverbs and poetry',
            ),
            _divider(),
            _buildSection(
              image: 'assets/poem.jpg',
              title: 'Talk Talk an Poem',
              description:
                  'Catch the vibe of deep words and sweet poems in Koloqua style!',
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Navigate to Settings Page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              },
              child: Text(
                'Go to Settings',
                style: GoogleFonts.poppins(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({
    required String image,
    required String title,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Image.asset(image, width: 100, height: 100, fit: BoxFit.cover),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: GoogleFonts.poppins(fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _divider() {
    return const Divider(height: 20, thickness: 1);
  }
}