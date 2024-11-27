import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Import the specific screens for navigation
import 'fulani_poetry.dart';
import 'swahili_proverbs.dart';
import 'zulu_proverbs.dart';
import 'koloqua_poetry.dart';

class ProverbsPoetryScreen extends StatelessWidget {
  const ProverbsPoetryScreen({super.key});

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
              context: context,
              image: 'assets/african_mask.jpg',
              title: 'Tinndi e Jime',
              description:
                  'Step into the world of wise sayings and soulful Fulani poetry',
              navigateTo: FulaniPoetryScreen(),
            ),
            _divider(),
            _buildSection(
              context: context,
              image: 'assets/african.jpg',
              title: 'Methali na Mashairi',
              description:
                  'Embark on a journey through timeless wisdom and lyrical Swahili verses!',
              navigateTo: SwahiliProverbsScreen(),
            ),
            _divider(),
            _buildSection(
              context: context,
              image: 'assets/izoga.jpg',
              title: 'Izaga nezinkondlo',
              description:
                  'Feel the heartbeat of Africa with powerful Zulu proverbs and poetry',
              navigateTo: ZuluProverbsScreen(),
            ),
            _divider(),
            _buildSection(
              context: context,
              image: 'assets/poem.jpg',
              title: 'Talk Talk an Poem',
              description:
                  'Catch the vibe of deep words and sweet poems in Koloqua style!',
              navigateTo: KoloquaPoetryScreen(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({
    required BuildContext context,
    required String image,
    required String title,
    required String description,
    required Widget navigateTo,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => navigateTo),
        );
      },
      child: Padding(
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
      ),
    );
  }

  Widget _divider() {
    return const Divider(height: 20, thickness: 1);
  }
}
