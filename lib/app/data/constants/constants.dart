import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Constants{
  static void showErrorToast({required String msg, String title = "Error"}) {
    Get.showSnackbar(GetSnackBar(
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.red,
      title: title,
      message: msg,
      duration: const Duration(milliseconds: 2000),
    ));
  }

  static void showSuccessToast({required String msg, Duration? duration}) {
    Get.showSnackbar(GetSnackBar(
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green,
      title: "Success",
      message: msg,
      duration: duration ?? const Duration(milliseconds: 1000),
    ));
  }
}