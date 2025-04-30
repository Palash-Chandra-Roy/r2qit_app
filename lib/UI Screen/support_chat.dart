import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';

import '../Coustom_Widget/ask_box.dart';
import '../Coustom_Widget/custom_service_card.dart';

class SupportChat extends StatelessWidget {
  SupportChat({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.arrow_back,
                      size: 30,
                    ),
                    Text(
                      "FAQ",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.chat_bubble_outlined,
                      size: 30,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Center(
                child: const Text(
                  "How can we help you?",
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              TextFormField(),
              SizedBox(
                height: height * 0.03,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CustomServiceCard(
                      icon: Icons.notifications_none_rounded,
                      title: "Questions about",
                      subtitle: "Getting Stared",
                      color: Colors.blue.shade100,
                    ),
                    CustomServiceCard(
                      icon: Icons.settings,
                      title: "Questions about",
                      subtitle: "How to Inves",
                      color: Colors.green.shade100,
                    ),
                    CustomServiceCard(
                      icon: FontAwesome5Solid.money_bill,
                      title: "Questions about",
                      subtitle: "Payment Meth…",
                      color: Colors.red.shade100,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.020,
              ),
              Row(
                children: [
                  Text(
                    "Top Questions",
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  Text(
                    "See All",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                        fontSize: 20),
                  )
                ],
              ),
              SizedBox(
                height: height * 0.025,
              ),
              // Expanded(
              //   child: ListView.builder(
              //       itemCount: faq.length,
              //       itemBuilder: (context, index) {
              //         String ask = faq[index];
              //         return AskBox(
              //           ask: "$ask",
              //         );
              //       }),
              // ),
              SizedBox(height: 500, child: FAQScreen())
            ],
          ),
        )),
      ),
    );
  }

  List<String> faq = [
    "How to create an account?",
    "How to reset my password?",
    "Where can I find my profile?",
    "How to contact support?",
    "Is my data secure?",
  ];
}
