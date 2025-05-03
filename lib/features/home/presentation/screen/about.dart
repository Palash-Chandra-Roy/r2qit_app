import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r2ait_app/core/constants/fontsize_control/widget_support.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatelessWidget {
  const About({super.key});

  Future<void> _launchLink(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 14,
            color: Colors.black,
          ),
        ),
        title: Text("About", style: AppWidget.appBarTextFeildStyle()),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Semantics(
              label: "R2A IT",
              child: Image.asset(
                "assets/images/logo.png",
                height: 100,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            SelectableText(
              "R2A IT Service Agency, Delivering Custom Solutions. "
              "Custom Web Design Solutions To Drive Conversions. Effective SEO Campaigns To Generate Growth. "
              "Tailored Branding Strategies To Drive Engagement. "
              "At R2AIT, we believe technology is more than just code—it's the backbone of modern business success. "
              "We're a full-service IT agency delivering tailored digital solutions that help brands thrive in a competitive landscape. "
              "From high-converting websites and intuitive web apps to data-driven dashboards and standout presentations, "
              "we combine design, development, and strategy to bring your ideas to life.",
              style: AppWidget.appBarTextFeildStyle(),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 20),

            // Operated by
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Operated by",
                  style: AppWidget.simpleTextFeildStyle(),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () => _launchLink('https://r2ait.com/'),
                  child: Text(
                    'R2AIT',
                    style: AppWidget.brand1TextFeildStyle(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Technology Solutions Provider",
                  style: AppWidget.simpleTextFeildStyle(),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () => _launchLink('https://r2ait.com/'),
                  child: Text(
                    'R2AIT',
                    style: AppWidget.brand1TextFeildStyle(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
