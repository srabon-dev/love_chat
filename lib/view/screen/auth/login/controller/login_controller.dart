import 'package:chat_app/core/app_route.dart';
import 'package:chat_app/service/auth_service.dart';
import 'package:chat_app/utils/constants/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  LoginController({required this.authServices});
  AuthServices authServices;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  Future<void> signInWithEmailAndPassword ()async{
    isLoading = true;
    update();
    try{
      await authServices.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim()
      );
      isLoading = false;
      update();
      Get.snackbar("Success".tr, "Login Successful".tr,snackPosition: SnackPosition.BOTTOM);
      Get.offAndToNamed(AppRoute.navBar);
    } on FirebaseAuthException catch(error){
      isLoading = false;
      update();
      Get.snackbar("Error".tr, error.message??"",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.pink100,
        colorText: AppColors.white100
      );
    }
  }


}