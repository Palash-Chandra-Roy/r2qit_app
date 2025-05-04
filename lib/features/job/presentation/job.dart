import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/controller_control/job_controller.dart';

class Job extends StatelessWidget {
  Job({super.key});
  JobController _jobController = Get.put(JobController());
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.white),
              currentAccountPicture: CircleAvatar(
                backgroundImage: ExactAssetImage("assets/images/palash.jpg"),
              ),
              accountName: Text(
                "Palash Roy",
                style: TextStyle(color: Colors.black),
              ),
              accountEmail: Text("palashtpi21@gmail.com",
                  style: TextStyle(color: Colors.black)),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.book,
              ),
              title: Text("Billing Details"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.personal_injury),
              title: Text(
                "User Managment",
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text("Information"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text(
                "Logout",
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation: 0,
        title: Container(
          height: screenHeight * 0.04,
          width: screenWidth * 0.7,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.grey, width: 1)),
          child: TextField(
            onTap: () {},
            obscureText: false,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 10),
                prefixIcon: Icon(Icons.search),
                hintText: "Search Jobs",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                print("Chatting Option ");
              },
              icon: Icon(
                Icons.offline_bolt,
                size: 20,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () {
                print("Notifications update");
              },
              icon: Icon(
                Icons.notifications,
                size: 20,
                color: Colors.black,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10, top: 5),
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.04,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: _jobController.jobTitle.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(width: 1, color: Colors.grey)),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              _jobController.jobTitle[index].title,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Divider(
                color: Colors.grey,
              ),
              Container(
                height: screenHeight * 0.6,
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Top Job Picks for you",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Based on your profile, preferences, and activity like applies, searches, and saves",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHu0qU0enmKKGdb7o_jydb3szsjpRutwVqbg&s"),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Quality Assurance Enginnner \n(Autoation) - (For R2A IT.....)",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text("Bdjobs.com\nDhaka, Bangladesh(On-site)",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  )),
                              Row(
                                children: [
                                  Icon(
                                    Icons.task_alt,
                                    size: 20,
                                    color: Colors.green,
                                  ),
                                  Text(
                                    "Applicant review time is typically 3 days ",
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    " 'Viewed .",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    " 'Promoted .",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
                                        color: Colors.black),
                                  ),
                                  Image.asset(
                                    "assets/images/logo.png",
                                    height: 40,
                                    width: 40,
                                  ),
                                  Text(
                                    " 'Easy Apply .",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.close,
                              size: 30,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 60),
                        child: Divider(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                  onTap: () {
                    // Get to all job post
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Show all",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.arrow_right_alt,
                        color: Colors.black,
                        size: 25,
                      ),
                    ],
                  )),
              Divider(
                color: Colors.grey,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Recent Searches",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                          onTap: () {
                            //Get to Clear Data page
                          },
                          child: Text(
                            "Clear",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Software engineer",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Alert On . Dhaka, Bangladesh . Full-time . On-site. Remote.... ",
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Software engineer",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Alert On . Dhaka, Bangladesh . Full-time . On-site. Remote.... ",
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
