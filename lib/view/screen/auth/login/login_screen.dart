import 'package:chat_app/core/app_route.dart';
import 'package:chat_app/service/auth_service.dart';
import 'package:chat_app/utils/constants/app_colors.dart';
import 'package:chat_app/view/screen/auth/login/controller/login_controller.dart';
import 'package:chat_app/view/widgets/custom_text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  void initState() {
    Get.put(AuthServices(sharedPreferences: Get.find()));
    Get.put(LoginController(authServices: Get.find()));
    super.initState();
  }
  final formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Form(
                  key: formKey,
                  child: GetBuilder<LoginController>(
                    builder: (controller) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
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
                              "Email".tr,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          CustomTextField(
                            hintText: "Email".tr,
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
                              "Password".tr,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          CustomTextField(
                            hintText: "Password".tr,
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
                            height: 5,
                          ),
                          GestureDetector(
                            onTap: (){
                              Get.toNamed(AppRoute.forgetScreen);
                            },
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "Forget Password?".tr,
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          SizedBox(
                                width: constraints.maxWidth,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if(formKey.currentState!.validate()){
                                      controller.signInWithEmailAndPassword();
                                    }
                                  },
                                  child: controller.isLoading? const Center(child: CircularProgressIndicator(color: AppColors.white100,),): Text("Login".tr),
                                ),
                              ),
                          const SizedBox(
                            height: 24,
                          ),
                          GestureDetector(
                            onTap: (){
                              Get.toNamed(AppRoute.registerScreen);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don’t have an account?".tr,
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                Text(
                                  " Create now".tr,
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
              ),
            );
          },
        ),
      ),
    );
  }
}
