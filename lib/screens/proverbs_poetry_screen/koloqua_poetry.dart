import 'package:flutter/material.dart';

class KoloquaPoetryScreen extends StatefulWidget {
  @override
  _KoloquaPoetryScreenState createState() => _KoloquaPoetryScreenState();
}

class _KoloquaPoetryScreenState extends State<KoloquaPoetryScreen> {
  // List of poems in koloqua translated to english
  final List<Map<String, String>> poems = [
    {
      "koloqua": """Day na come, we jus dey wait,  
Rain go fall but e go dry too.  
Pikin dem laugh, de world feel new,  
Inside de storm, hope dey carry us.  
  
Plenty wahala but we still stand,  
De sun go shine, e no dey lie.  
We go waka till we find peace,  
Together we dey, no one go loose.""",
      "english": """The day arrives, and we just wait,  
Rain falls but dries eventually too.  
Children laugh, the world feels renewed,  
Through the storm, hope carries us through.  
  
Many troubles, yet we remain strong,  
The sun shines and never deceives.  
We'll walk until we find our peace,  
Together we stand, no one shall leave."""
    },
    {
      "koloqua": """De moon dey watch, e no dey sleep,  
De breeze dey blow, e tell stories.  
Pikin dem sing for tomorrow bright,  
De road hard but we go make am.  
  
No forget de old people words,  
Dem na wisdom we dey follow.  
River long but we go cross am,  
Together we dey, e go better.""",
      "english": """The moon watches and never sleeps,  
The breeze whispers tales untold.  
Children sing for tomorrow's light,  
The road is tough, but we'll prevail.  
  
Never forget the elders' wisdom,  
Their words guide us like stars.  
The river is long, but we'll cross it,  
Together we stand, it will get better."""
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

    // ScrollController to manage scrolling if necessary
    ScrollController _scrollController = ScrollController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Koloqua Short Poems",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Scrollbar(
        controller: _scrollController,
        thumbVisibility: true,
        thickness: 8.0,
        radius: Radius.circular(8),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 40),
                // Title "Koloqua Poetry" in pink
                Text(
                  "Talk Talk an Poem",
                  style: TextStyle(
                    fontSize: screenWidth * 0.08,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Lobster',
                    color: Color(0xFFFF5678),
                    letterSpacing: 2.5,
                    shadows: [
                      Shadow(
                        offset: Offset(4, 4),
                        blurRadius: 8,
                        color: Colors.grey.withOpacity(0.7),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                // Koloqua Poem Box
                Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Text(
                    poems[currentIndex]["koloqua"]!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lobster',
                      color: Colors.black,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // English Translation Box
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Text(
                    poems[currentIndex]["english"]!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Georgia',
                      color: Colors.grey[800],
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
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 32.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
