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
        appBar: AppBar(
          automaticallyImplyLeading: true,
        ),
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
                          prefixIcon: const Icon(Icons.person),
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
                          prefixIcon: const Icon(Icons.email),
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
                          prefixIcon: const Icon(Icons.phone),
                          controller: controller.phoneController,
                          validator: (value) {
                            bool mobileValid = RegExp(r'^(?:\+?88|0088)?01[13-9]\d{8}$').hasMatch(value);
                            if (value == null || value.isEmpty) {
                              return "This field can not be empty".tr;
                            } else if (!value.contains('+8801')) {
                              return "Please enter a valid Phone Number".tr;
                            } else if(mobileValid == false){
                              return "Please enter a valid Phone Number".tr;
                            }else if(value.length != 14){
                              return "Please enter a valid Phone Number".tr;
                            } else{
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
                          prefixIcon: const Icon(Icons.lock),
                          controller: controller.passwordController,
                          isPassword: true,
                          isPrefixIcon: true,
                          validator: (value){
                            if(value.isEmpty){
                              return "Please enter your password";
                            } else if(controller.passwordController.text != controller.confirmPasswordController.text){
                              return "Password doesn't match";
                            }
                            return null;
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
                          prefixIcon: const Icon(Icons.lock),
                          isPassword: true,
                          controller: controller.confirmPasswordController,
                          isPrefixIcon: true,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Please enter your password";
                            } else if (!RegExp(
                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                .hasMatch(controller.passwordController.text)) {
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
