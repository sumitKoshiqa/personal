import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Constants.dart';
import 'dart:io' show Platform;

class ShowMessages {
  void showSnackBarRed(title, message) async {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.black87.withOpacity(0.5),
      colorText: Colors.white,
      snackPosition: Platform.isIOS ? SnackPosition.TOP : SnackPosition.BOTTOM,
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10, top: 10),
    );
  }

  void showSnackBarGreen(title, message) async {
    Get.snackbar(
      title,
      message,
      backgroundColor: Constants.accentGreen,
      colorText: Colors.white,
      snackPosition: Platform.isIOS ? SnackPosition.TOP : SnackPosition.BOTTOM,
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10, top: 10),
    );
  }
}
