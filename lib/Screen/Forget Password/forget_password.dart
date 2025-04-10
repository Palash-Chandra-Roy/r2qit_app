import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r2ait_app/Coustom_Widget/CustomBottom/custom_bottom.dart';
import 'package:r2ait_app/Coustom_Widget/CustomTextFromField/custom_text_from_field.dart';
import 'package:r2ait_app/Screen/BottomNavBar/bottom_navbar_screen.dart';
import 'package:r2ait_app/Screen/Home_Screen/home_screen.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    bool isCheck = false;
    String checkStatus = "UnCheck";

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 16,
              color: Colors.black,
            )),
        title: Text(
          "Create New Password",
          style: TextStyle(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 10, left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  "assets/images/forgot.png",
                  height: 300,
                  width: 300,
                ),
              ),
              SizedBox(
                height: screenheight * 0.01,
              ),
              Text(
                "Create Your New Password",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              CustomTextFormField(
                hintText: "Password",
                prefixIcon: Icon(Icons.lock),
                filled: true,
                keyboardType: TextInputType
                    .visiblePassword, // More appropriate for password input
                obscureText: true, // Usually true for password fields
                suffixIcon: Icon(Icons.visibility_off),
                // validator: (value) {
                //   if (value == null || value.isEmpty) {
                //     return "Password is required"; // Meaningful error message
                //   }
                //   if (value.length < 6) {
                //     return "Password must be at least 6 characters long"; // Basic validation
                //   }
                //   return null!; // Valid input
                // },
              ),
              SizedBox(
                height: screenheight * 0.01,
              ),
              CustomTextFormField(
                hintText: "Confirm Password",
                prefixIcon: Icon(Icons.lock),
                filled: true,
                keyboardType: TextInputType
                    .visiblePassword, // More appropriate for password input
                obscureText: true, // Usually true for password fields
                suffixIcon: Icon(Icons.visibility_off),
                // validator: (value) {
                //   if (value == null || value.isEmpty) {
                //     return "Password is required"; // Meaningful error message
                //   }
                //   if (value.length < 6) {
                //     return "Password must be at least 6 characters long"; // Basic validation
                //   }
                //   return null!; // Valid input
                // },
              ),
              SizedBox(
                height: screenheight * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: isCheck,
                    onChanged: (bool? newVal) {
                      setState(() {
                        isCheck = newVal ?? false;
                        Text(isCheck ? "Check" : "UnCheck"); // টেক্সট আপডেট
                      });
                    },
                  ),
                  Flexible(
                    child: Text(
                      "Remember me",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ),

                  // Checkbox(
                  //     value: isCheck,
                  //     onChanged: (bool? newVal) {
                  //       setState(() {
                  //         isCheck = newVal!;
                  //       });
                  //       Text(isCheck ? "Check" : "UnCheck");
                  //     }),
                  // Flexible(
                  //   child: Text(
                  //     "Remember me",
                  //     style: TextStyle(fontSize: 18, color: Colors.black),
                  //   ),
                  // ),
                ],
              ),
              SizedBox(
                height: screenheight * 0.06,
              ),
              CustomButtom(
                  buttomText: "Continue",
                  color: Color(0xFFA020F0),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        title: Center(
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/images/con.png",
                                height: 120,
                                width: 120,
                              ),
                              SizedBox(
                                height: screenheight * 0.01,
                              ),
                              Text("Congratulations!",
                                  style: TextStyle(
                                      color: Color(0xFFA020F0),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(
                                height: screenheight * 0.01,
                              ),
                              Text("Your Account is redy to use",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(
                                height: screenheight * 0.01,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFFA020F0)),
                                onPressed: () {
                                  Get.to(BottomNavbarScreen());
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                      "Go to HomePages",
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  );
                                },
                                child: Text(
                                  "Go to Homepages",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );

                    //
                  },
                  textColor: Colors.black),
              SizedBox(
                height: screenheight * 0.03,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
