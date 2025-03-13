import 'package:flutter/material.dart';

class JobScreen extends StatefulWidget {
  const JobScreen({super.key});

  @override
  State<JobScreen> createState() => _JobScreenState();
}

class _JobScreenState extends State<JobScreen> {
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
        backgroundColor: Colors.white,
        elevation: 0,
        title: Container(
          height: screenHeight * 0.04,
          width: screenWidth * 0.7,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.grey, width: 1)),
          child: TextField(
            onTap: () {},
            obscureText: true,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 10),
                prefixIcon: Icon(Icons.search),
                hintText: "Search",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
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
        child: Column(),
      ),
    );
  }
}
