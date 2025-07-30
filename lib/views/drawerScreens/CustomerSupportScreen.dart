import 'package:flutter/material.dart';

class CustomerSupportScreen extends StatelessWidget {
  final List<Map<String, String>> faqs = [
    {
      'question': 'How can I reset my password?',
      'answer':
          'To reset your password, go to the settings screen, select "Change Password", and follow the instructions.'
    },
    {
      'question': 'How do I update my profile?',
      'answer':
          'Navigate to your profile screen, click on the edit icon, make the necessary changes, and save your updates.'
    },
    {
      'question': 'How can I delete my account?',
      'answer':
          'To delete your account, please contact our customer support team through the app or send an email to support@tourmentor.com.'
    },
    {
      'question': 'How can I book a tour?',
      'answer':
          'To book a tour, go to the Tours section, select your preferred tour, and follow the booking instructions.'
    },
    {
      'question': 'What payment methods are accepted?',
      'answer':
          'We accept credit/debit cards, Bank, and other major payment methods.'
    },
    {
      'question': 'Can I get a refund?',
      'answer':
          'Refunds are subject to our refund policy. Please refer to the Terms and Conditions for more details.'
    },
    {
      'question': 'How do I change my notification settings?',
      'answer':
          'To change your notification settings, go to the Settings screen, and toggle the notification switch to enable or disable notifications as per your preference.'
    },
    {
      'question': 'How can I contact customer support?',
      'answer':
          'You can contact our customer support team by navigating to the "Customer Support" section in the app and choosing the "Contact Us" option. You can also send an email to support@tourmentor.com.'
    },
    {
      'question': 'How do I add a place to my selected places?',
      'answer':
          'To add a place to your selected places, navigate to the Tours section, choose the place you want to add, and click on the "Add to Selected Places" button.'
    },
    {
      'question': 'Can I share my selected places with friends?',
      'answer':
          'Yes, you can share your selected places with friends by going to the "Selected Places" screen, selecting the place you want to share, and clicking the "Share" button. You can share via social media, email, or messaging apps.'
    },
    {
      'question': 'How do I provide feedback about a tour?',
      'answer':
          'To provide feedback about a tour, go to the "My Tours" section, select the tour you want to provide feedback for, and click on the "Provide Feedback" button. Fill out the feedback form and submit it.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer Support'),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: faqs.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            child: ExpansionTile(
              title: Text(faqs[index]['question']!),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(faqs[index]['answer']!),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
