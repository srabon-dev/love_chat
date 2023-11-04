import 'package:chat_app/core/app_route.dart';
import 'package:chat_app/utils/constants/app_colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhoneSignUpController extends GetxController{

  TextEditingController phoneController = TextEditingController(text: '+88');
  TextEditingController otpController = TextEditingController();
  bool isLoading = false;
  bool optLoading = false;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<void> signInWithPhoneNumber()async {
    isLoading = true;
    update();
    try {
      firebaseAuth.verifyPhoneNumber(
          phoneNumber: phoneController.text.trim(),
          timeout: const Duration(minutes: 2),
          verificationCompleted: (_){
            isLoading = false;
            update();
          },
          verificationFailed: (FirebaseAuthException exception){
            isLoading = false;
            update();
            Get.snackbar("Error".tr, exception.message??"Error verification Failed",
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: AppColors.pink100,
                colorText: AppColors.white100
            );
          },
          codeSent: (String verification, int? code){
            isLoading = false;
            update();
            Get.offAndToNamed(AppRoute.otpScreen, arguments: verification);
          },
          codeAutoRetrievalTimeout: (e){
            isLoading = false;
            update();
          }
      );
    } on FirebaseAuthException catch (error) {
      isLoading = false;
      update();
      Get.snackbar("Error".tr, error.message ?? "",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.pink100,
          colorText: AppColors.white100
      );
    }
  }


  Future verifyOtp({required String verificationId}) async{
    optLoading = true;
    update();
    try {
      PhoneAuthCredential phoneAuthCredential =
      PhoneAuthProvider.credential(verificationId: verificationId, smsCode: otpController.text.trim());

      await firebaseAuth.signInWithCredential(phoneAuthCredential).then((value) async {
        Get.snackbar("Success".tr, "Login Successful".tr,
            snackPosition: SnackPosition.BOTTOM);
        optLoading = false;
        update();

        await firebaseFirestore.collection("user").doc(firebaseAuth.currentUser?.uid ?? "").set({
          'name': '',
          'email': '',
          'imageUrl': "",
          'phone': phoneController.text.trim(),
          'uid': firebaseAuth.currentUser?.uid ?? "",
        }).then((value) {
          isLoading = false;
          update();
          Get.snackbar("Success".tr, "Account Create Successful".tr,
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: AppColors.pink100,
              colorText: AppColors.white100);
          Get.offAndToNamed(AppRoute.navBar);
        });

      }).onError((error, stackTrace){
        Get.snackbar("Error".tr, error.toString(),
            snackPosition: SnackPosition.BOTTOM);
        optLoading = false;
        update();
        Get.offAndToNamed(AppRoute.navBar);
      });

    } on FirebaseAuthException catch (error) {
      optLoading = false;
      update();
      Get.snackbar("Error".tr, error.message ?? "",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.pink100,
          colorText: AppColors.white100
      );
    }
  }
}