import 'package:chat_app/utils/constants/app_colors.dart';
import 'package:chat_app/view/screen/auth/phone_auth/phone_auth_controller/phone_auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final formKey = GlobalKey<FormState>();
  String verificationId = '';
  @override
  void initState() {
    Get.put(PhoneSignUpController());
    verificationId = Get.arguments;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        bottomNavigationBar: GetBuilder<PhoneSignUpController>(
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    controller.verifyOtp(verificationId: verificationId);
                  },
                  child: controller.optLoading
                      ? const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.white100,
                    ),
                  )
                      : Text("Continue".tr),
                ),
              ),
            );
          }
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints){
            return Center(
              child: GetBuilder<PhoneSignUpController>(
                builder: (controller) {
                  return SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
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
                          Padding(
                            padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
                            child: Column(
                              children: [
                                const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Please enter the OTP code.",
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 24),
                                Flexible(
                                  flex: 0,
                                  child: PinCodeTextField(
                                    cursorColor: AppColors.pink100,
                                    controller: controller.otpController,
                                    keyboardType: TextInputType.number,
                                    appContext: (context),
                                    validator: (value){
                                      if (value!.length == 6) {
                                        return null;
                                      } else {
                                        return "Please enter the OTP code.";
                                      }
                                    },
                                    autoFocus: true,
                                    pinTheme: PinTheme(
                                      shape: PinCodeFieldShape.box,
                                      borderRadius: BorderRadius.circular(8),
                                      fieldHeight: 56,
                                      fieldWidth: 44,
                                      activeFillColor: AppColors.white100,
                                      selectedFillColor: AppColors.green10,
                                      inactiveFillColor: AppColors.white100,
                                      borderWidth: 0.5,
                                      errorBorderColor: AppColors.red80,
                                      selectedColor: AppColors.green100,
                                      activeColor: AppColors.black100,
                                      inactiveColor: const Color(0xFF9D9999),
                                    ),
                                    length: 6,
                                    enableActiveFill: true,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Did not get the OTP?",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          ),
                                    ),
                                    GestureDetector(
                                      onTap: (){

                                      },
                                      /*controller.isResend? const Row(
                                        children: [
                                          Icon(Icons.check_circle_outline_outlined,size: 25),
                                          Icon(Icons.check_circle_outline_outlined,size: 25),
                                        ],
                                      ):*/
                                      child: const Text(
                                        "Resend OTP",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }
              ),
            );
          },
        ),
      ),
    );
  }
}