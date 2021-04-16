import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../profile/bindings/profile_binding.dart';
import '../../profile/views/profile_view.dart';
import '../bindings/settings_binding.dart';
import '../views/language_view.dart';
import '../views/theme_mode_view.dart';

import '../../../routes/app_pages.dart';

class SettingsController extends GetxController {
  var currentIndex = 0.obs;
  final pages = <String>[Routes.PROFILE, Routes.SETTINGS_LANGUAGE, Routes.SETTINGS_THEME_MODE];

  void changePage(int index) {
    currentIndex.value = index;
    Get.toNamed(pages[index], id: 1);
  }

  Route onGenerateRoute(RouteSettings settings) {
    if (settings.name == Routes.PROFILE)
      return GetPageRoute(
        settings: settings,
        page: () => ProfileView(hideAppBar: true),
        binding: ProfileBinding(),
      );

    if (settings.name == Routes.SETTINGS_LANGUAGE)
      return GetPageRoute(
        settings: settings,
        page: () => LanguageView(hideAppBar: true),
        binding: SettingsBinding(),
      );

    if (settings.name == Routes.SETTINGS_THEME_MODE)
      return GetPageRoute(
        settings: settings,
        page: () => ThemeModeView(hideAppBar: true),
        binding: SettingsBinding(),
      );

    return null;
  }

  @override
  void onInit() {
    super.onInit();
  }
}
