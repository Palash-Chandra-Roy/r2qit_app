import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:get/get.dart';
import 'package:r2ait_app/features/home/presentation/screen/support_chat_page.dart';

import '../widget/ask_box.dart';
import '../widget/custom_faq_tupper.dart';
import '../widget/faq_card.dart';

class FAQPage extends StatefulWidget {
  FAQPage({super.key});

  @override
  State<FAQPage> createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
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
              CustomFaqTupper(
                  text: "FAQ",
                  goToSupportChatPage: goToSupportChatPage,
                  icon: Icons.chat_bubble_outlined,
                  backButton: () {
                    Get.back();
                  }),

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
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Search", suffixIcon: Icon(Icons.search)),
              ),
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

  goToSupportChatPage() {
    Get.to(() => SupportChatPage());
  }
}
