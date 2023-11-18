import 'package:chat_app/utils/constants/app_colors.dart';
import 'package:chat_app/view/widgets/custom_text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bkash_checkout_controller/checkout_controller.dart';
import 'bkash_checkout_repo/checkout_repo.dart';

class BkashCheckOutScreen extends StatefulWidget {
  const BkashCheckOutScreen({super.key});

  @override
  State<BkashCheckOutScreen> createState() => _BkashCheckOutScreenState();
}

class _BkashCheckOutScreenState extends State<BkashCheckOutScreen> {
  @override
  void initState() {
    Get.put(BkashCheckoutRepo());
    Get.put(BkashCheckoutController(bkashCheckoutRepo: Get.find()));
    super.initState();
  }
  String amount = "0";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          centerTitle: false,
          title: const Text("Bkash Payment",),
        ),
        bottomNavigationBar: GetBuilder<BkashCheckoutController>(builder: (controller) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () async {
                  if (controller.amountController.text == '') {
                    Get.snackbar("Error", "Please Enter Amount And Invoice",
                        colorText: AppColors.white100);
                  } else {
                    controller.bkashPaymentTokenGenerateResult();
                  }
                },
                child: controller.tokenGenerateLoading? const Center(child: CircularProgressIndicator(),) : Text("Deposit Amount".tr),
              ),
            ),
          );
        }),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              physics: const BouncingScrollPhysics(),
              child: SizedBox(
                width: constraints.maxWidth,
                child: GetBuilder<BkashCheckoutController>(builder: (controller) {
                  return Column(
                    children: [
                      SizedBox(
                        width: constraints.maxWidth,
                        child: Card(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Total Amount : ",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.pink60,
                                    fontSize: 16),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(amount.isEmpty?"0": amount,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.pink100,
                                    fontSize: 24),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        controller: controller.amountController,
                        hintText: "Enter Amount",
                        keyboardType: TextInputType.number,
                        prefixIcon: const Icon(Icons.attach_money_rounded),
                        onChanged: (price){
                          amount = price;
                          setState(() {});
                        },
                      ),
                    ],
                  );
                }),
              ),
            );
          },
        ),
      ),
    );
  }
}
