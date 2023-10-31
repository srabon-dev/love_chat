import 'dart:io';
import 'package:chat_app/core/app_route.dart';
import 'package:chat_app/utils/constants/app_colors.dart';
import 'package:chat_app/view/widgets/custom_text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            centerTitle: false,
            title: Text("Edit Profile".tr),
          ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: AppColors.pink100,width: 5),
                    ),
                    child: ClipRRect(borderRadius: BorderRadius.circular(100),
                      // child: Image.memory(File("path").readAsBytesSync(),fit: BoxFit.fill,),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Text("Change Profile".tr,style: Theme.of(context).textTheme.labelLarge,),
                  const SizedBox(
                    height: 24,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Name".tr,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomTextField(
                    hintText: "Name".tr,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Phone Number".tr,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomTextField(
                    hintText: "Phone Number".tr,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  SizedBox(
                    width: constraints.maxWidth,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed(AppRoute.loginScreen);
                      },
                      child: Text("Save".tr),
                    ),
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
