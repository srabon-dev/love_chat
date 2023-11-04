import 'package:chat_app/core/app_route.dart';
import 'package:chat_app/utils/constants/app_images.dart';
import 'package:chat_app/view/widgets/custom_container/custom_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: false,
          title: Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Text("Settings".tr),
          ),
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  CustomContainer(
                    text: "Change password".tr,
                    isIcon: true,
                    image: AppImages.lock,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomContainer(
                    text: "Change Language".tr,
                    isIcon: true,
                    image: AppImages.translate,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomContainer(
                    text: "Delete Account".tr,
                    isIcon: true,
                    image: AppImages.trash,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomContainer(
                    text: "Upgrade Account".tr,
                    isIcon: true,
                    image: AppImages.membership,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  GestureDetector(
                    onTap: () async{
                      try {
                        FirebaseAuth firebaseAuth = FirebaseAuth.instance;
                        await firebaseAuth.signOut();
                        Get.snackbar("Success".tr, "LogOut Successful".tr,snackPosition: SnackPosition.BOTTOM);
                        Get.offAndToNamed(AppRoute.loginScreen);
                      }catch(error){
                        Get.snackbar("Success".tr, "Error LogOut".tr,snackPosition: SnackPosition.BOTTOM);
                      }
                    },
                    child: CustomContainer(
                      text: "Log Out".tr,
                      isIcon: true,
                      image: AppImages.logout,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
