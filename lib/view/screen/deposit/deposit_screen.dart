import 'package:chat_app/core/app_route.dart';
import 'package:chat_app/utils/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DepositScreen extends StatefulWidget {
  const DepositScreen({super.key});

  @override
  State<DepositScreen> createState() => _DepositScreenState();
}

class _DepositScreenState extends State<DepositScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          centerTitle: false,
          title: Text("Deposit".tr),
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Column(
              children: [
                const SizedBox(height: 12,),
                Card(
                  child: ListTile(
                    onTap: ()=>Get.toNamed(AppRoute.bkashCheckOutScreen),
                    leading: SizedBox(
                      height: 50,
                      width: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(AppImages.bkash,fit: BoxFit.fill,),
                        ),
                      ),
                    ),
                    title: const Text("Bkash"),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: SizedBox(
                      height: 50,
                      width: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.asset(AppImages.stripe,fit: BoxFit.fill,),
                      ),
                    ),
                    title: const Text("Stripe"),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
