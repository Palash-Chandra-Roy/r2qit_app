import 'package:flutter/material.dart';
import 'package:r2ait_app/Coustom_Widget/custom_faq_tupper.dart';

class SupportChatPage extends StatelessWidget {
  const SupportChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Scaffold(
        body: SafeArea(
      child: Column(children: [
        CustomFaqTupper(
          text: "Support",
        ),
        SizedBox(
          height: height * 0.08,
        ),
        SizedBox(
          width: width,
          height: height * 0.85,
          child: ListView.builder(
            itemCount: 50,
            itemBuilder: (context, index) {
              bool isMe = false;
              return Row(
                children: [
                  SizedBox(width: width * 0.02),
                  isMe == false
                      ? CircleAvatar(
                          radius: 25,
                          // backgroundImage: NetworkImage(
                          // // data.image != null && data.image!.isNotEmpty
                          // // ? data.image!
                          // //     : ImagesPath.networkImage,
                          // ),
                        )
                      : Text(""),
                  SizedBox(
                    width: isMe ? width * 0.00 : width * 0.035,
                  ),
                  Container(
                    width: width * 0.8,
                    margin: EdgeInsets.symmetric(
                      vertical: width * 0.03,
                    ),
                    padding: EdgeInsets.all(width * 0.003),
                    decoration: BoxDecoration(
                      color: isMe ? Colors.blue : Colors.grey,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(isMe ? 20 : 0),
                        bottomRight: Radius.circular(isMe ? 0 : 20),
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "this is a message",
                          overflow: TextOverflow.visible,
                          softWrap: true,
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: width * 0.02),
                  isMe == true
                      ? CircleAvatar(
                          radius: 25,
                          // backgroundImage: NetworkImage(
                          // data.image != null && data.image!.isNotEmpty
                          // ? data.image!
                          //     : ImagesPath.networkImage,
                          // ),
                        )
                      : Text(""),
                ],
              );
            },
          ),
        ),
      ]),
    ));
  }
}
