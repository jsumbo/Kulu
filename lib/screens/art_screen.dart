import 'package:flutter/material.dart';

class ArtScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.person, color: Colors.black), // Profile Icon
          onPressed: () {
            // Handle profile action
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.black), // Bell Icon
            onPressed: () {
              // Handle notifications
            },
          ),
          IconButton(
            icon: Icon(Icons.settings, color: Colors.black), // Settings Icon
            onPressed: () {
              // Handle settings
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text(
              'Art from all over Africa',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            // First Image (Full Width)
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/art1.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 10),
            // Row with Two Images (One Extending)
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/art2.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/art3.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            // Row with Two Images (Other Extending)
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/art4.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/art5.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Spacer(), // Push bottom icons to the end
            // Bottom Icons Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Art Icon (Black Circle with White Star)
                _buildCircleIcon(
                  icon: Icons.star,
                  iconColor: Colors.white,
                  backgroundColor: Colors.black,
                ),
                // History Icon (White Circle with Black Star)
                _buildCircleIcon(
                  icon: Icons.star,
                  iconColor: Colors.black,
                  backgroundColor: Colors.white,
                ),
                // Customes Icon (White Circle with Black Star)
                _buildCircleIcon(
                  icon: Icons.star,
                  iconColor: Colors.black,
                  backgroundColor: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper Widget to Build Circle Icons
  Widget _buildCircleIcon({
    required IconData icon,
    required Color iconColor,
    required Color backgroundColor,
  }) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Icon(
          icon,
          color: iconColor,
        ),
      ),
    );
  }
}
