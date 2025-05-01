import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r2ait_app/Coustom_Widget/custom_faq_tupper.dart';

class SupportChatPage extends StatefulWidget {
  const SupportChatPage({super.key});

  @override
  State<SupportChatPage> createState() => _SupportChatPageState();
}

class _SupportChatPageState extends State<SupportChatPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            CustomFaqTupper(
              backButton: () {
                Get.back();
              },
              text: "Support",
            ),
            SizedBox(
              height: height * 0.02,
            ),
            SizedBox(
              width: width,
              height: height * 0.80,
              child: ListView.builder(
                itemCount: 50,
                itemBuilder: (context, index) {
                  bool isMe = false;
                  return Row(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Optional: better alignment
                    children: [
                      SizedBox(width: width * 0.02),

                      // 👤 Avatar only if not me
                      !isMe
                          ? CircleAvatar(
                              radius: 25,
                              // backgroundImage: NetworkImage(
                              //   data.image != null && data.image!.isNotEmpty
                              //       ? data.image!
                              //       : ImagesPath.networkImage,
                              // ),
                            )
                          : SizedBox(
                              width: 25), // maintain space when isMe == true

                      SizedBox(width: isMe ? 0 : width * 0.035),

                      // 💬 Chat bubble
                      Expanded(
                        child: Align(
                          alignment: isMe
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Container(
                            margin: EdgeInsets.symmetric(
                              vertical: width * 0.03,
                            ),
                            padding: EdgeInsets.all(width * 0.02),
                            decoration: BoxDecoration(
                              color: isMe
                                  ? Colors.red.shade200
                                  : Colors.grey.shade300,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(isMe ? 20 : 0),
                                bottomRight: Radius.circular(isMe ? 0 : 20),
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            child: Text(
                              "This is a message This is a message This is a message This is a message This is a message This is a messageThis is a message", // Message text here
                              overflow: TextOverflow.visible,
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(width: width * 0.02),
                    ],
                  );
                },
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Row(
              children: [
                SizedBox(width: width * 0.01),
                Icon(Icons.image_rounded),
                SizedBox(width: width * 0.01),
                Icon(Icons.attach_file),
                SizedBox(width: width * 0.02),
                SizedBox(
                    width: width * 0.7,
                    child: TextFormField(
                      decoration: InputDecoration(
                          suffixIcon: Icon(Icons.emoji_emotions),
                          hintText: "Type here..."),
                    )),
                SizedBox(width: width * 0.03),
                Icon(Icons.send)
              ],
            )
          ]),
        ),
      ),
    ));
  }
}
