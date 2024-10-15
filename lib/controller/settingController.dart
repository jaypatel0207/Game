import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  final RxBool isMusicOn = false.obs;
  final RxBool isSoundOn = false.obs;
  final RxBool isNightModeOn = false.obs;

  void toggleMusic() => isMusicOn.toggle();
  void toggleSound() => isSoundOn.toggle();

  void toggleNightMode() {
    isNightModeOn.toggle();
    updateTheme();
  }

  void updateTheme() {
    Get.changeTheme(isNightModeOn.value ? ThemeData.dark() : ThemeData.light());
  }

  @override
  void onInit() {
    super.onInit();
    ever(isNightModeOn, (_) => updateTheme());
  }
}