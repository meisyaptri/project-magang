import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SignupController extends GetxController {
  TextEditingController emailC = TextEditingController(text: "");
TextEditingController passC = TextEditingController(text: "");

@override
  void onClose() {
    emailC.dispose();
    passC.dispose();
    super.onClose();
  }
}
