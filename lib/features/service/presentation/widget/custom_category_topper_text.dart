import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../logic/admin_check.dart';

class service_toper_text extends StatelessWidget {
  service_toper_text({
    super.key,
  });
  ServiceControl _serviceControl = Get.find<ServiceControl>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenHeight = size.height;
    final screenWidth = size.width;

    return Container(
      height: screenHeight * 0.05,
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 35,
            backgroundImage: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBqAgD'
                'u31Xn0lMKtAeZn_h-rsmNi53S1Oo3lkMhQ17S2Ges904vk7RlUc8eLLmbxJKZ4E&usqp=CAU'),
          ),
          SizedBox(width: screenWidth * 0.02),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'R2A IT',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Explore Our Featured Services',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const Spacer(),
          _serviceControl.isAdmin.value
              ? IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.grey.shade200,
                    shape: const CircleBorder(),
                  ),
                  onPressed: () {
                    // Add your action here
                  },
                  icon: const Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                )
              : Text("")
        ],
      ),
    );
  }
}
