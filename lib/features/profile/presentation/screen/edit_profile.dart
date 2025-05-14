import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r2ait_app/core/constants/fontsize_control/widget_support.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    TextEditingController dobController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 16,
            color: Colors.black,
          ),
        ),
        title: Center(
          child: Text("Edit Profile", style: AppWidget.appBarTextFeildStyle()),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: screenWidth * 0.3,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.blueGrey,
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://www.shutterstock.com/shutterstock/videos/3606751217/thumb/1.jpg?ip=x480",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: InkWell(
                        onTap: () {
                          print("Edit Cover Photo");
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 18,
                          child:
                              Icon(Icons.edit, size: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),

                // Profile Image with edit icon
                Positioned(
                  bottom: -50,
                  left: MediaQuery.of(context).size.width / 2 - 50,
                  child: Container(
                    width: 100,
                    height: 100,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        // Profile Image
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 3),
                          ),
                          child: ClipOval(
                            child: Image.network(
                              "https://st3.depositphotos.com/15648834/17930/v/450/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        // Edit Icon
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: InkWell(
                            onTap: () {
                              print("Profile photo edit tapped");
                              // অথবা: Get.to(EditProfile());
                            },
                            child: CircleAvatar(
                              backgroundColor: Colors.grey.shade800,
                              radius: 16,
                              child: Icon(Icons.edit,
                                  size: 14, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration:
                              const InputDecoration(labelText: "First Name*"),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextFormField(
                          decoration:
                              const InputDecoration(labelText: "Last Name*"),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Email"),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: dobController,
                          readOnly: true, //
                          decoration: const InputDecoration(
                            labelText: "Date of Birth*",
                            suffixIcon: Icon(Icons.calendar_today),
                            border: OutlineInputBorder(),
                          ),
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime(1994, 10, 17),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                            );

                            if (pickedDate != null) {
                              dobController.text =
                                  "${pickedDate.toLocal()}".split(' ')[0];
                            }
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: DropdownButtonFormField(
                          items: ['Male', 'Female', 'Other']
                              .map((e) =>
                                  DropdownMenuItem(value: e, child: Text(e)))
                              .toList(),
                          onChanged: (value) {},
                          decoration:
                              const InputDecoration(labelText: "Gender"),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration:
                        const InputDecoration(labelText: "Phone Number"),
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 10),
                  DropdownButtonFormField(
                    items: ['Engineer', 'Doctor', 'Artist']
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (value) {},
                    decoration: const InputDecoration(labelText: "Profession"),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Webside"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: ElevatedButton(
                        onPressed: () {
                          Get.to(EditProfile());
                        },
                        child: Text(
                          "Submit",
                          style: AppWidget.brand1TextFeildStyle(),
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
