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
        title: Text("aboutTitle".tr, style: AppWidget.appBarTextFeildStyle()),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Semantics(
              label: "companyName".tr,
              child: Image.asset(
                "assets/images/logo.png",
                height: 100,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            SelectableText(
              "aboutDescription".tr,
              style: AppWidget.appBarTextFeildStyle(),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 20),

            // Operated by
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "operatedBy".tr,
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
                  "technologyProvider".tr,
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
