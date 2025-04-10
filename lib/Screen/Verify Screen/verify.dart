import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:r2ait_app/Coustom_Widget/CustomBottom/custom_bottom.dart';
import 'package:r2ait_app/Coustom_Widget/CustomTextFromField/custom_text_from_field.dart';
import 'package:r2ait_app/Screen/Forget%20Password/forget_password.dart';

class Verify extends StatefulWidget {
  const Verify({super.key});

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 14,
              color: Colors.black,
            )),
        title: Text(
          "Verify Gmail",
          style: TextStyle(
              fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: screenheight * 0.01,
            ),
            Text(
              "We have sand a verification code your email  \n Please Check you email enter the code ",
              style: TextStyle(fontSize: 16, color: Color(0xFF5C5C5C)),
            ),
            SizedBox(
              height: screenheight * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 60,
                  width: 50,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Color(0xFF5C5C5C)),
                      borderRadius: BorderRadius.circular(
                        4,
                      ),
                      color: Colors.grey),
                  child: Center(
                    child: Text(
                      "1",
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  width: screenWidth * 0.01,
                ),
                Container(
                  height: 60,
                  width: 50,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Color(0xFF5C5C5C)),
                      borderRadius: BorderRadius.circular(
                        4,
                      ),
                      color: Colors.grey),
                  child: Center(
                    child: Text(
                      "1",
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  width: screenWidth * 0.01,
                ),
                Container(
                  height: 60,
                  width: 50,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Color(0xFF5C5C5C)),
                      borderRadius: BorderRadius.circular(
                        4,
                      ),
                      color: Colors.grey),
                  child: Center(
                    child: Text(
                      "1",
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  width: screenWidth * 0.01,
                ),
                Container(
                  height: 60,
                  width: 50,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Color(0xFF5C5C5C)),
                      borderRadius: BorderRadius.circular(
                        4,
                      ),
                      color: Colors.grey),
                  child: Center(
                    child: Text(
                      "1",
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  width: screenWidth * 0.01,
                ),
                Container(
                  height: 60,
                  width: 50,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Color(0xFF5C5C5C)),
                      borderRadius: BorderRadius.circular(
                        4,
                      ),
                      color: Colors.grey),
                  child: Center(
                    child: Text(
                      "1",
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  width: screenWidth * 0.01,
                ),
                Container(
                  height: 60,
                  width: 50,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Color(0xFF5C5C5C)),
                      borderRadius: BorderRadius.circular(
                        4,
                      ),
                      color: Colors.grey),
                  child: Center(
                    child: Text(
                      "1",
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: screenWidth * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "didn't get the code?",
                  style: TextStyle(fontSize: 14, color: Color(0xFF0F172A)),
                ),
                SizedBox(
                  width: 8,
                ),
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Text(
                    'Resent',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF7E22CD),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: screenheight * 0.4,
            ),
            CustomButtom(
                buttomText: "Send OTP ",
                color: Color(0xFFA020F0),
                onPressed: () {
                  Get.to(ForgetPassword());
                },
                textColor: Colors.black),
          ],
        ),
      ),
    );
  }
}
