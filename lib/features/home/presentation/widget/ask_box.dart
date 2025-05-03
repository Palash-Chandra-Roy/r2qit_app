import 'package:flutter/material.dart';

class FAQItem {
  final String question;
  final String answer;
  bool isExpanded;

  FAQItem({
    required this.question,
    required this.answer,
    this.isExpanded = false,
  });
}

class FAQScreen extends StatefulWidget {
  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  List<FAQItem> faqList = [
    FAQItem(
      question: "How to create an account?",
      answer: "Click on 'Sign Up', fill out your details, and submit the form.",
    ),
    FAQItem(
      question: "How to reset my password?",
      answer:
          "Click on 'Forgot Password', enter your email, and follow the instructions.",
    ),
    FAQItem(
      question: "Is my data secure?",
      answer: "Yes, we use encryption and secure servers to protect your data.",
    ),
    FAQItem(
      question: "Can I change my profile information?",
      answer: "Yes, go to 'Profile Settings' to update your information.",
    ),
    FAQItem(
      question: "How do I contact support?",
      answer: "Go to 'Help & Support' in the app and submit your query.",
    ),
    FAQItem(
      question: "Is the app free to use?",
      answer:
          "Yes, the basic version is free. Premium features may require payment.",
    ),
    FAQItem(
      question: "Can I use the app offline?",
      answer:
          "Some features are available offline, but syncing needs internet.",
    ),
    FAQItem(
      question: "How do I delete my account?",
      answer: "Go to 'Account Settings' and select 'Delete Account'.",
    ),
    FAQItem(
      question: "How often is my data backed up?",
      answer: "Your data is automatically backed up every 24 hours.",
    ),
    FAQItem(
      question: "Can I customize notifications?",
      answer: "Yes, go to 'Notification Settings' and adjust as needed.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: faqList.length,
      itemBuilder: (context, index) {
        final item = faqList[index];
        return GestureDetector(
          onTap: () {
            setState(() {
              item.isExpanded = !item.isExpanded;
            });
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
              color: item.isExpanded ? Colors.orange.shade50 : Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.question,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                if (item.isExpanded) ...[
                  SizedBox(height: 10),
                  Text(
                    item.answer,
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                ]
              ],
            ),
          ),
        );
      },
    );
  }
}
