import 'package:flutter/material.dart';

class CustomResentprojectDetails extends StatelessWidget {
  var service;
  VoidCallback goToResentDetailsProject;
  CustomResentprojectDetails(
      {super.key, this.service, required this.goToResentDetailsProject});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: screenHeight * 0.25,
      width: screenWidth * 0.28,
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          Image.asset(
            "assets/images/project2.png",
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: screenHeight * 0.001,
          ),
          Text(
            service.name ?? "",
            style: TextStyle(fontSize: 10, color: Colors.black),
          ),
          SizedBox(
            height: screenHeight * 0.001,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 15),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade500,
                ),
                onPressed: () => goToResentDetailsProject(),
                child: Text(
                  "See Live",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
