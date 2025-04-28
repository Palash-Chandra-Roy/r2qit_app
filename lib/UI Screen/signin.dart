import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r2ait_app/Coustom_Widget/custombuttom.dart';
import 'package:r2ait_app/UI%20Screen/signup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back_ios,
              size: 14,
              color: Colors.black,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 30, left: 20, right: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Image.asset(
              height: 120,
              "assets/images/logo.png",
            ), // Replace with actual logo

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(width: 100, height: 4, color: Colors.purple),
                SizedBox(width: 5),
                Container(width: 100, height: 4, color: Colors.blue.shade300),
              ],
            ),
            SizedBox(
              height: screenheight * 0.1,
            ),
            Text(
              "Let's You In ",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(
              height: screenheight * 0.05,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(width: 2, color: Colors.grey)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/facebook.png",
                      height: 30,
                      width: 30,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Continue with Facebook",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(width: 2, color: Colors.grey)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/google.png",
                      height: 30,
                      width: 30,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Continue with Google",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(width: 2, color: Colors.grey)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/apple.png",
                      height: 30,
                      width: 30,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Continue with Apple",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 3,
                  width: screenWidth * 0.38,
                  color: Colors.grey,
                ),
                Text(
                  "Or",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 3,
                  width: screenWidth * 0.38,
                  color: Colors.grey,
                ),
              ],
            ),
            SizedBox(
              height: screenheight * 0.02,
            ),
            CustomButton(
                buttonText: "SignIn With Password",
                color: Color(0xFFA020F0),
                onPressed: () {},
                textColor: Colors.black),

            SizedBox(
              height: 10,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an Account?",
                  style: TextStyle(fontSize: 14, color: Color(0xFF0F172A)),
                ),
                SizedBox(
                  width: 8,
                ),
                InkWell(
                  onTap: () {
                    Get.to(signupScreen());
                  },
                  child: Text(
                    'Sing Up!',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF7E22CD),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
