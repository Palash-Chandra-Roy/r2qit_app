import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';

class SupportChat extends StatelessWidget {
  const SupportChat({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
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
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              height: height * 0.15,
              width: width,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  // color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "How to create a account?",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Icon(
                    Icons.line_axis,
                    color: Colors.red,
                  )
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}

class CustomServiceCard extends StatelessWidget {
  IconData icon;
  String title;
  String subtitle;
  Color? color;
  CustomServiceCard(
      {super.key,
      required this.icon,
      required this.title,
      required this.subtitle,
      this.color});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Container(
      height: height * 0.14,
      width: width * 0.35,
      margin: EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15), // চাইলে গোল কোণ
        boxShadow: [
          const BoxShadow(
            color: Colors.black26,
            blurRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon),
            SizedBox(
              height: height * 0.040,
            ),
            Text("$title"),
            Text(
              "$subtitle",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}
