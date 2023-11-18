import 'package:chat_app/core/app_route.dart';
import 'package:chat_app/utils/constants/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {

  bool loading = false;
  TextEditingController currentPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();

  Future<void> changePassword() async {
    loading = true;
    update();

    final user = FirebaseAuth.instance.currentUser;
    final cred = EmailAuthProvider.credential(email: user?.email ?? "", password: currentPassword.text.trim());

    user?.reauthenticateWithCredential(cred).then((value) {
      user.updatePassword(newPassword.text.trim()).then((_) {
        loading = false;
        update();
        Get.snackbar("Success".tr, "Password Change Successful".tr,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: AppColors.pink100,
            colorText: AppColors.white100);
        Get.offAndToNamed(AppRoute.navBar);
      }).catchError((error) {
        loading = false;
        update();
        Get.snackbar("Error".tr, error.message ?? error,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: AppColors.pink100,
            colorText: AppColors.white100);
      });
    }).catchError((err) {
      loading = false;
      update();
      Get.snackbar("Error".tr, err.message ?? err,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.pink100,
          colorText: AppColors.white100);
    });
  }
}
