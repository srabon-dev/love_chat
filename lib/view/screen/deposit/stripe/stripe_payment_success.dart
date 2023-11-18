import 'dart:async';
import 'package:chat_app/core/app_route.dart';
import 'package:chat_app/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StripePaymentSuccessScreen extends StatefulWidget {
  const StripePaymentSuccessScreen({super.key});

  @override
  State<StripePaymentSuccessScreen> createState() => _StripePaymentSuccessScreenState();
}

class _StripePaymentSuccessScreenState extends State<StripePaymentSuccessScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2),(){
      Get.offAndToNamed(AppRoute.navBar);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      top: false,
      child: Scaffold(
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return const SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.star,size: 200,color: AppColors.pink100,),
                    SizedBox(height: 10,),
                    Text("thank you your payment has been successful !!",style: TextStyle(color: AppColors.pink60),),
                    CircularProgressIndicator(
                      color: AppColors.pink100,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
