import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsController extends GetxController {
  var isDarkMode = false.obs;
  var isNotificationOn = true.obs;
  var isSearchVisible = true.obs;
  var selectedLanguage = 'English'.obs;

  final List<String> languages = [
    'English',
    'বাংলা',
  ];

  Map<String, String> languageMap = {
    'English': 'en',
    'বাংলা': 'bn',
  };

  @override
  void onInit() {
    super.onInit();
    _loadSavedLanguage();
  }

  void toggleTheme(bool value) => isDarkMode.value = value;

  void toggleNotification(bool value) => isNotificationOn.value = value;

  void toggleSearchVisibility(bool value) => isSearchVisible.value = value;

  void changeLanguage(String value) => selectedLanguage.value = value;

  // ✅ Save language and update locale
  Future<void> persistAndChangeLanguage(String value) async {
    changeLanguage(value);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', value);

    final langCode = languageMap[value];
    if (langCode != null) {
      Get.updateLocale(Locale(langCode));
    }
  }

  // ✅ Load saved language at startup
  Future<void> _loadSavedLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final savedLang = prefs.getString('language');

    if (savedLang != null && languageMap.containsKey(savedLang)) {
      selectedLanguage.value = savedLang;
      final langCode = languageMap[savedLang]!;
      Get.updateLocale(Locale(langCode));
    }
  }
}
