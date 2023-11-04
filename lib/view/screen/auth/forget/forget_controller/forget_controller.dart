import 'package:chat_app/core/app_route.dart';
import 'package:chat_app/utils/constants/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgetController extends GetxController{

  TextEditingController emailController = TextEditingController();
  bool isLoading = false;

  Future<void> forgetPassword() async{
    isLoading = true;
    update();
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text.trim()).then((value){
        isLoading = false;
        update();
        Get.snackbar("Success".tr, "Successful".tr,snackPosition: SnackPosition.BOTTOM);
        Get.offAndToNamed(AppRoute.loginScreen);
      }).onError((error, stackTrace){
        isLoading = false;
        update();
        Get.snackbar("Error".tr, error.toString()??"",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: AppColors.pink100,
            colorText: AppColors.white100
        );
      });
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