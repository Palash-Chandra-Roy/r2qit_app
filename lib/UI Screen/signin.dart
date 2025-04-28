import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r2ait_app/App%20Fontsize/widget_support.dart';
import 'package:r2ait_app/Coustom_Widget/custombuttom.dart';
import 'package:r2ait_app/UI%20Screen/signup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // final GoogleSignIn _googleSignIn = GoogleSignIn();
  // final FirebaseAuth _auth = FirebaseAuth.instance;

  // Future<void> signInWithGoogle() async {
  //   try {
  //     final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
  //     if (googleUser == null) {
  //       // User cancelled the sign-in
  //       return;
  //     }

  //     final GoogleSignInAuthentication googleAuth =
  //         await googleUser.authentication;

  //     final OAuthCredential credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken,
  //       idToken: googleAuth.idToken,
  //     );

  //     // Sign in to Firebase
  //     await _auth.signInWithCredential(credential);

  //     // After successful sign-in, you can navigate to your home screen or another screen
  //     print("User Signed In: ${_auth.currentUser?.displayName}");
  //     // Example: Navigate to HomeScreen
  //     // Get.to(HomeScreen());
  //   } catch (e) {
  //     print("Error during Google Sign-In: $e");
  //     Get.snackbar("Error", "Google Sign-In failed");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 100, left: 20, right: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Image.asset(
              height: 200,
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
              height: screenheight * 0.05,
            ),
            Text(
              "Let's You In ",
              style: AppWidget.hederTextFeildStyle(),
            ),
            SizedBox(
              height: screenheight * 0.06,
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
                      style: AppWidget.appBarTextFeildStyle(),
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
              height: 30,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an Account?",
                  style: AppWidget.appBarTextFeildStyle(),
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
                    style: AppWidget.parpleTextFeildStyle(),
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
