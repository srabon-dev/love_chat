import 'package:chat_app/core/app_route.dart';
import 'package:chat_app/utils/constants/app_colors.dart';
import 'package:chat_app/view/screen/auth/forget/forget_controller/forget_controller.dart';
import 'package:chat_app/view/widgets/custom_text_field/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetScreen extends StatefulWidget {
  const ForgetScreen({super.key});

  @override
  State<ForgetScreen> createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {

  @override
  void initState() {
    Get.put(ForgetController());
    super.initState();
  }
  TextEditingController emailController = TextEditingController();
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text("Forget Password".tr),
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: GetBuilder<ForgetController>(
                  builder: (controller) {
                    return Form(
                      key: formKey,
                      child: Column(
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
                            controller: emailController,
                            prefixIcon: const Icon(Icons.email),
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
                            height: 24,
                          ),
                          SizedBox(
                            width: constraints.maxWidth,
                            child: ElevatedButton(
                              onPressed: () async {
                                if(formKey.currentState!.validate()){
                                  isLoading = true;
                                  setState(() {

                                  });
                                  try{
                                    await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text.trim());
                                    Get.snackbar("Mail Sent Successfully!".tr, "Please Check Your Email".tr,snackPosition: SnackPosition.BOTTOM);
                                    Get.offAndToNamed(AppRoute.loginScreen);
                                  } on FirebaseAuthException catch(error){
                                    isLoading = false;
                                    setState(() {

                                    });
                                    Get.snackbar("Error 2".tr, error.message??"",
                                        snackPosition: SnackPosition.BOTTOM,
                                        backgroundColor: AppColors.pink100,
                                        colorText: AppColors.white100
                                    );
                                  }
                                }
                              },
                              child: controller.isLoading?
                              const Center(child: CircularProgressIndicator(color: AppColors.pink100,),) :
                              Text("Continue".tr),
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                        ],
                      ),
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
/*
    .then((value){
isLoading = false;
setState(() {

});

Get.snackbar("Success".tr, "Successful".tr,snackPosition: SnackPosition.BOTTOM);
Get.offAndToNamed(AppRoute.loginScreen);
}).onError((error, stackTrace){
isLoading = false;
setState(() {

});
Get.snackbar("Error 1".tr, error.toString(),
snackPosition: SnackPosition.BOTTOM,
backgroundColor: AppColors.pink100,
colorText: AppColors.white100
);
});*/
