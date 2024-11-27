import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SubscriptionPage extends StatefulWidget {
  @override
  _SubscriptionPageState createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  final User? user = FirebaseAuth.instance.currentUser;
  String? selectedPlan;

  final List<Map<String, dynamic>> subscriptionPlans = [
    {
      'name': 'Free',
      'price': 0,
      'icon': Icons.attach_money,
      'features': [
        'Access to basic African language lessons',
        'Limited daily quiz attempts',
        'Basic proverb collection',
      ],
      'recommended': false,
    },
    {
      'name': 'Pro',
      'price': 9.99,
      'icon': Icons.star,
      'features': [
        'All Free tier features',
        'Unlimited quiz attempts',
        'Comprehensive proverb library',
        'Advanced learning tracks',
      ],
      'recommended': true,
    },
    {
      'name': 'Premium',
      'price': 19.99,
      'icon': Icons.paid,
      'features': [
        'All Pro tier features',
        'Personal language coach',
        'Exclusive cultural content',
        'Offline access',
        'Multiple African language specializations',
      ],
      'recommended': false,
    },
  ];

  void handleSubscriptionSelect(String planName, double planPrice) async {
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please sign in first')),
      );
      return;
    }

    try {
      final userId = user!.uid;
      await FirebaseFirestore.instance
          .collection('subscriptions')
          .doc(userId)
          .set({
        'plan': planName,
        'price': planPrice,
        'startDate': DateTime.now(),
      });
      setState(() {
        selectedPlan = planName;
      });
    } catch (error) {
      print('Subscription update failed: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kulu Language Subscriptions'),
        actions: [
          if (user != null)
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(user!.photoURL ?? ''),
                ),
                SizedBox(width: 8),
                Text(user!.displayName ?? ''),
                IconButton(
                  icon: Icon(Icons.logout),
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    setState(() {});
                  },
                ),
              ],
            )
          else
            TextButton.icon(
              onPressed: () async {
                // Implement Google Sign-In here
              },
              icon: Icon(Icons.login, color: Colors.white),
              label: Text('Sign In', style: TextStyle(color: Colors.white)),
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Unlock the richness of African languages',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.5,
                ),
                itemCount: subscriptionPlans.length,
                itemBuilder: (context, index) {
                  final plan = subscriptionPlans[index];
                  final isSelected = selectedPlan == plan['name'];
                  return GestureDetector(
                    onTap: () =>
                        handleSubscriptionSelect(plan['name'], plan['price']),
                    child: Card(
                      color: isSelected ? Colors.blue[50] : Colors.white,
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: isSelected ? Colors.blue : Colors.grey[300]!,
                          width: isSelected ? 2 : 1,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(plan['name'],
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                                Icon(plan['icon'],
                                    color:
                                        isSelected ? Colors.blue : Colors.grey,
                                    size: 30),
                              ],
                            ),
                            SizedBox(height: 8),
                            Text('\$${plan['price']}/month',
                                style: TextStyle(fontSize: 16)),
                            SizedBox(height: 8),
                            if (plan['recommended'])
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.yellow[100],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text('Most Popular',
                                    style:
                                        TextStyle(color: Colors.yellow[800])),
                              ),
                            SizedBox(height: 8),
                            Expanded(
                              child: ListView(
                                children: List.generate(
                                  plan['features'].length,
                                  (i) => Row(
                                    children: [
                                      Icon(Icons.check,
                                          color: Colors.green, size: 16),
                                      SizedBox(width: 8),
                                      Expanded(
                                          child: Text(plan['features'][i])),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
