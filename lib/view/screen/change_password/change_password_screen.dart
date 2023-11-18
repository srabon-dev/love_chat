import 'package:chat_app/utils/constants/app_colors.dart';
import 'package:chat_app/view/screen/change_password/change_password_controller/change_password_controller.dart';
import 'package:chat_app/view/widgets/custom_text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {

  @override
  void initState() {
    Get.put(ChangePasswordController());
    super.initState();
  }
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Form(
                  key: formKey,
                  child: GetBuilder<ChangePasswordController>(
                      builder: (controller) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Current Password".tr,
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            CustomTextField(
                              hintText: "Current Password".tr,
                              controller: controller.currentPassword,
                              prefixIcon: const Icon(Icons.lock),
                              isPassword: true,
                              isPrefixIcon: true,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Please enter your current password";
                                } else if (!RegExp(
                                    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                    .hasMatch(value)) {
                                  return "Please use uppercase,lowercase,spacial character and number";
                                } else if (value.length < 8) {
                                  return "Please use 8 character long password";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "New Password".tr,
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            CustomTextField(
                              hintText: "New Password".tr,
                              controller: controller.newPassword,
                              prefixIcon: const Icon(Icons.lock),
                              isPassword: true,
                              isPrefixIcon: true,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Please enter your new password";
                                } else if (!RegExp(
                                    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                    .hasMatch(value)) {
                                  return "Please use uppercase,lowercase,spacial character and number";
                                } else if (value.length < 8) {
                                  return "Please use 8 character long password";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            SizedBox(
                              width: constraints.maxWidth,
                              child: ElevatedButton(
                                onPressed: () {
                                  if(formKey.currentState!.validate()){
                                    controller.changePassword();
                                  }
                                },
                                child: controller.loading? const
                                Center(child: CircularProgressIndicator(color: AppColors.white100,),):
                                Text("Login".tr),
                              ),
                            ),
                          ],
                        );
                      }
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
