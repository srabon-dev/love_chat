import 'package:chat_app/core/app_route.dart';
import 'package:chat_app/service/auth_service.dart';
import 'package:chat_app/utils/constants/app_colors.dart';
import 'package:chat_app/view/screen/auth/register/controller/register_controller.dart';
import 'package:chat_app/view/widgets/custom_text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  @override
  void initState() {
    Get.put(AuthServices(sharedPreferences: Get.find()));
    Get.put(RegisterController(authServices: Get.find()));
    super.initState();
  }
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Form(
                key: formKey,
                child: GetBuilder<RegisterController>(
                  builder: (controller) {
                    return Column(
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        const Icon(
                          Icons.favorite,
                          color: AppColors.pink100,
                          size: 100,
                        ),
                        Text(
                          "Love Chat".tr,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
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
                          keyboardType: TextInputType.name,
                          controller: controller.nameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "This field can not be empty".tr;
                            }else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Email".tr,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        CustomTextField(
                          hintText: "Email".tr,
                          keyboardType: TextInputType.emailAddress,
                          controller: controller.emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "This field can not be empty".tr;
                            } else if (!value.contains(RegExp('\@'))) {
                              return "Please enter a valid email".tr;
                            } else {
                              return null;
                            }
                          },
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
                          keyboardType: TextInputType.phone,
                          controller: controller.phoneController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "This field can not be empty".tr;
                            } else if (value.length < 11) {
                              return "Phone Number should be 11 characters".tr;
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Password".tr,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        CustomTextField(
                          hintText: "Password".tr,
                          keyboardType: TextInputType.text,
                          controller: controller.passwordController,
                          isPassword: true,
                          isPrefixIcon: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "This field can not be empty".tr;
                            } else if (value.length < 6) {
                              return "Password should be more than 6 characters".tr;
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Confirm Password".tr,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        CustomTextField(
                          hintText: "Confirm Password".tr,
                          keyboardType: TextInputType.text,
                          isPassword: true,
                          controller: controller.confirmPasswordController,
                          isPrefixIcon: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "This field can not be empty".tr;
                            } else if (value.length < 6) {
                              return "Password should be more than 6 characters".tr;
                            } else if (value != controller.passwordController.text) {
                              return "Password do not match".tr;
                            } else {
                              return null;
                            }
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
                                controller.createAccountWithEmailAndPassword();
                              }
                            },
                            child: controller.isLoading? const Center(child: CircularProgressIndicator(),):Text("Register".tr),
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        GestureDetector(
                          onTap: (){
                            Get.toNamed(AppRoute.loginScreen);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account?".tr,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              Text(
                                  " Login Now".tr,
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                            ],
                          ),
                        )
                      ],
                    );
                  }
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
