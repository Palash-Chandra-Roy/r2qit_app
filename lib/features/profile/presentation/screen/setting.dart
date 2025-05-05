import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/setting_controller.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SettingsController());

    return Scaffold(
      appBar: AppBar(title: Text('settings'.tr)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Profile
          ListTile(
            leading: const CircleAvatar(
              backgroundImage: AssetImage("assets/images/palash.jpg"),
            ),
            title: Text("name".tr),
            subtitle: Text("email".tr),
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                // Edit profile
              },
            ),
          ),
          const Divider(),

          // Theme Toggle
          Obx(() => SwitchListTile(
                title: Text("dark_mode".tr),
                secondary: const Icon(Icons.dark_mode),
                value: controller.isDarkMode.value,
                onChanged: controller.toggleTheme,
              )),

          // Notification Toggle
          Obx(() => SwitchListTile(
                title: Text("push_notifications".tr),
                secondary: const Icon(Icons.notifications),
                value: controller.isNotificationOn.value,
                onChanged: controller.toggleNotification,
              )),

          // Privacy Toggle
          Obx(() => SwitchListTile(
                title: Text("search_visibility".tr),
                secondary: const Icon(Icons.lock_open),
                value: controller.isSearchVisible.value,
                onChanged: controller.toggleSearchVisibility,
              )),

          // Language Dropdown
          Obx(() => ListTile(
                leading: const Icon(Icons.language),
                title: Text("app_language".tr),
                trailing: DropdownButton<String>(
                  value: controller.selectedLanguage.value,
                  items: controller.languages
                      .map((lang) => DropdownMenuItem(
                            value: lang,
                            child: Text(lang),
                          ))
                      .toList(),
                  onChanged: (value) {
                    changeLanguage(value!, controller);
                  },
                ),
              )),

          const Divider(),

          ListTile(
            leading: const Icon(Icons.info),
            title: Text("about_app".tr),
            onTap: () {},
          ),

          ListTile(
            leading: const Icon(Icons.manage_accounts),
            title: Text("manage_account".tr),
            onTap: () {},
          ),

          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: Text("logout".tr, style: const TextStyle(color: Colors.red)),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  void changeLanguage(String value, var controller) async {
    final prefs = await SharedPreferences.getInstance();

    // Controller update
    controller.changeLanguage(value);

    // Save preference
    await prefs.setString('language', value);

    // Get saved value safely
    final savedLanguage = prefs.getString('language');
    final langCode = controller.languageMap[savedLanguage];

    if (langCode != null) {
      Get.updateLocale(Locale(langCode));
    }
  }
}
