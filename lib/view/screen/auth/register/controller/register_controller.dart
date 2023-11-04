import 'package:chat_app/core/app_route.dart';
import 'package:chat_app/service/auth_service.dart';
import 'package:chat_app/utils/constants/app_colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  RegisterController({required this.authServices});

  AuthServices authServices;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController(text: "+88");
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  bool isLoading = false;

  Future<void> createAccountWithEmailAndPassword() async {
    try {
      isLoading = true;
      update();
      await authServices
          .createAccountWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim())
          .then((value) async {
        await firebaseFirestore.collection("user").doc(authServices.currentUser?.uid ?? "").set({
          'name': nameController.text,
          'email': emailController.text.trim(),
          'imageUrl': "",
          'phone': phoneController.text.trim(),
          'uid': authServices.currentUser?.uid ?? "",
        }).then((value) {
          isLoading = false;
          update();
          Get.snackbar("Success".tr, "Account Create Successful".tr,
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: AppColors.pink100,
              colorText: AppColors.white100);
          Get.offAndToNamed(AppRoute.navBar);
        });
      });
    } on FirebaseAuthException catch (error) {
      isLoading = false;
      update();
      Get.snackbar("Error".tr, error.message ?? "",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.pink100,
          colorText: AppColors.white100);
    }
  }
}
