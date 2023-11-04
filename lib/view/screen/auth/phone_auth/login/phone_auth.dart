import 'package:chat_app/core/app_route.dart';
import 'package:chat_app/utils/constants/app_colors.dart';
import 'package:chat_app/view/widgets/custom_text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../phone_auth_controller/phone_auth_controller.dart';

class PhoneAuth extends StatefulWidget {
  const PhoneAuth({super.key});

  @override
  State<PhoneAuth> createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {
  @override
  void initState() {
    Get.put(PhoneSignUpController());
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
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              onPressed: () {
                Get.toNamed(AppRoute.loginScreen);
              },
              child: Text("Login With Email".tr),
            ),
          ),
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Center(
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Form(
                  key: formKey,
                  child:
                      GetBuilder<PhoneSignUpController>(builder: (controller) {
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
                            "Phone Number".tr,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        CustomTextField(
                          hintText: "Phone Number".tr,
                          controller: controller.phoneController,
                          prefixIcon: const Icon(Icons.phone,size: 18,),
                          keyboardType: TextInputType.number,
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
                          height: 24,
                        ),
                        SizedBox(
                          width: constraints.maxWidth,
                          child: ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                controller.signInWithPhoneNumber();
                              }
                            },
                            child: controller.isLoading
                                ? const Center(
                                    child: CircularProgressIndicator(
                                      color: AppColors.white100,
                                    ),
                                  )
                                : Text("Login With Phone".tr),
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
