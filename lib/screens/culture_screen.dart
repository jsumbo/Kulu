import 'package:flutter/material.dart';

class CultureScreen extends StatelessWidget {
  final List<Map<String, String>> culturalItems = [
    {
      'title': 'Maasai Beadwork',
      'description': 'Colorful beaded jewelry worn by the Maasai people of East Africa.',
      'image': 'assets/maasai_beadwork.jpg',
    },
    {
      'title': 'Adinkra Symbols',
      'description': 'Visual symbols created by the Akan people of Ghana, representing concepts or aphorisms.',
      'image': 'assets/adinkra_symbols.jpg',
    },
    // Add more ccontents
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: culturalItems.length,
      itemBuilder: (ctx, index) {
        return Card(
          child: Column(
            children: [
              Expanded(
                child: Image.asset(
                  culturalItems[index]['image']!,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    Text(
                      culturalItems[index]['title']!,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      culturalItems[index]['description']!,
                      style: TextStyle(fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}