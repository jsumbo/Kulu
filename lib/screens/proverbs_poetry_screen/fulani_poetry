import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PoetryScreen(),
    );
  }
}

class PoetryScreen extends StatefulWidget {
  @override
  _PoetryScreenState createState() => _PoetryScreenState();
}

class _PoetryScreenState extends State<PoetryScreen> {
  // List of longer poems in Fulani with their English translations
  final List<Map<String, String>> poems = [
    {
      "fulani": """Ngol waɗiri ko jawdi ndon,  
Heewondirde ngam toɓɓe maɓɓe.  
Jaangirde maɓɓe ɗum dow heewɓe,  
Ndokki ngal ndawi waɗɓe.  
  
Ngol kadi waɗiri ngam waɗe,  
Heewi ɗiɗi ngam waɗɗi kaɗi.  
Miin waɗi kadi ngam haɗii,  
Toɓɓe waɗira e rewɓe ngodi.""",
      "english": """The dawn brings hope to weary hearts,  
A stream flows for our ancestors' path.  
The lessons of the past guide our future,  
Through storms, our spirits find their way.  
  
The sun rises to witness our trials,  
Each moment shaped by our collective strength.  
In unity, we weather life's challenges,  
Bound together by the fabric of peace."""
    },
    {
      "fulani": """Kadi ngol naange waɗi ko wayri,  
Ngol waɗuɗi fuu ko waɗiraa.  
Toɓɓe waɗi ngam waɗere kaɗi,  
A rewɓe no ɗam waɗii e jam.  
  
Ngol haɗa toɓɓe ngam waɗani,  
Toɗɗan ngal ɗum dow ngal hayre.  
Miin waɗata ngam ɗum waɗana,  
Ngam waɗɗi kadi rewɓe waɗɓe.""",
      "english": """The sun lights our paths with its wisdom,  
Its warmth a bond between earth and sky.  
Our ancestors' whispers echo in the hills,  
Their blessings guide us in quiet resolve.  
  
The rivers run deep with their songs,  
The mountains hold stories of old.  
We walk their paths with steady steps,  
Our unity shines as bright as gold."""
    },
  ];

  // Current index to track displayed poem
  int currentIndex = 0;

  void showNextPoem() {
    setState(() {
      currentIndex = (currentIndex + 1) % poems.length; // Cycle through poems
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Fulani Short Poems",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 80), // Adjusted space before title
                // Fulani Poem Box
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Scrollbar(  // Wrap the SingleChildScrollView with Scrollbar
                      thumbVisibility: true,  // Keeps the scrollbar always visible
                      thickness: 8.0,  // Thickness of the scrollbar
                      radius: Radius.circular(8.0),  // Rounded corners
                      child: SingleChildScrollView(
                        child: Text(
                          poems[currentIndex]["fulani"]!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: screenWidth * 0.05, // Adjust font size to screen width
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Lobster', // Fancy and bold font for Fulani poems
                            color: Colors.black, // Black for emphasis
                            letterSpacing: 1.5, // Increased letter spacing
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // English Translation Box
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Scrollbar(  // Wrap the SingleChildScrollView with Scrollbar
                      thumbVisibility: true,  // Keeps the scrollbar always visible
                      thickness: 8.0,  // Thickness of the scrollbar
                      radius: Radius.circular(8.0),  // Rounded corners
                      child: SingleChildScrollView(
                        child: Text(
                          poems[currentIndex]["english"]!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: screenWidth * 0.045, // Adjust font size to screen width
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Georgia', // Elegant font for English translation
                            color: Colors.grey[800], // Dark gray for better visibility
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Next Button
                ElevatedButton(
                  onPressed: showNextPoem,
                  child: const Text(
                    "Next",
                    style: TextStyle(
                      color: Colors.white, // White text for better visibility
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Title "Fulani Poetry" in pink
          Positioned(
            top: 20,
            left: 16,
            right: 16,
            child: Text(
              "Tinndi e Jime",
              style: TextStyle(
                fontSize: screenWidth * 0.08, // Adjusted font size for title
                fontWeight: FontWeight.bold,
                fontFamily: 'Lobster', // Stylish font
                color: Color(0xFFFF5678), // Pink color for title
                letterSpacing: 2.5,
                shadows: [
                  Shadow(
                    offset: Offset(4, 4),
                    blurRadius: 8,
                    color: Colors.grey.withOpacity(0.7), // Shadow for depth
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
