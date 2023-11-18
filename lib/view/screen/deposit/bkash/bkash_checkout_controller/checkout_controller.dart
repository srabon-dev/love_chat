import 'dart:convert';
import 'package:chat_app/core/app_route.dart';
import 'package:chat_app/model/api_response_model.dart';
import 'package:chat_app/view/screen/deposit/bkash/bkash_checkout_repo/checkout_repo.dart';
import 'package:chat_app/view/screen/deposit/bkash/bkash_model/create_payment_model.dart';
import 'package:chat_app/view/screen/deposit/bkash/bkash_model/execute_payment_model.dart';
import 'package:chat_app/view/screen/deposit/bkash/bkash_model/grant_token_model.dart';
import 'package:chat_app/view/screen/deposit/bkash/bkash_model/query_payment_model.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class BkashCheckoutController extends GetxController{
  BkashCheckoutRepo bkashCheckoutRepo;
  BkashCheckoutController({required this.bkashCheckoutRepo});

  //Amount Controller
  final TextEditingController amountController = TextEditingController();

  //All Response Model
  CreatePaymentModel createPaymentModel = CreatePaymentModel();
  ExecutePaymentModel executePaymentModel = ExecutePaymentModel();
  QueryPaymentModel queryPaymentModel = QueryPaymentModel();
  GrantTokenResponse grantTokenResponse = GrantTokenResponse();

  //Grant Token Controller Start
  bool tokenGenerateLoading = false;
  Future<void> bkashPaymentTokenGenerateResult() async{
    tokenGenerateLoading = true;
    update();

    ApiResponseModel responseModel = await bkashCheckoutRepo.bkashPaymentGrantTokenGenerate();

    if(responseModel.statusCode == 200){
      grantTokenResponse = GrantTokenResponse.fromJson(responseModel.responseJson);
      bkashCreatePaymentResult(idToken: grantTokenResponse.idToken??"");
    }
    else{
      tokenGenerateLoading = false;
      update();
    }
    tokenGenerateLoading = false;
    update();
  }
  //Grant Token Controller End

  Future<void> bkashCreatePaymentResult({required String idToken}) async{

    ApiResponseModel responseModel = await bkashCheckoutRepo.bkashCreatePaymentResponse(
        idToken: idToken,
        amount: amountController.text.trim()
    );
    if(responseModel.statusCode == 200){
      createPaymentModel = CreatePaymentModel.fromJson(jsonDecode(responseModel.responseJson));
      tokenGenerateLoading = false;
      update();
      Get.offAndToNamed(AppRoute.bkashPaymentScreen,arguments: createPaymentModel.bkashUrl);
    }
    else{
      tokenGenerateLoading = false;
      update();
    }
    tokenGenerateLoading = false;
    update();
  }
  //Create Payment Controller End

  //Execute Payment Controller Start
  bool bkashExecutePaymentLoading = false;
  Future<void> bkashExecutePaymentResult({required String idToken, required String paymentID}) async{
    bkashExecutePaymentLoading = true;
    update();

    ApiResponseModel responseModel = await bkashCheckoutRepo.bkashExecutePaymentResponse(
        idToken: idToken,
        paymentID: paymentID,
    );
    if(responseModel.statusCode == 200){
      executePaymentModel = ExecutePaymentModel.fromJson(jsonDecode(responseModel.responseJson));
      bkashExecutePaymentLoading = false;
      update();
    }
    else{
      bkashExecutePaymentLoading = false;
      update();
    }
    bkashExecutePaymentLoading = false;
    update();
  }
  //Execute Payment Controller End

  //Query Payment Controller Start
  bool bkashQueryPaymentLoading = false;
  Future<void> bkashQueryPaymentResult({required String idToken, required String paymentID}) async{
    bkashQueryPaymentLoading = true;
    update();

    ApiResponseModel responseModel = await bkashCheckoutRepo.bkashQueryPaymentResponse(
      idToken: idToken,
      paymentID: paymentID,
    );
    if(responseModel.statusCode == 200){
      executePaymentModel = ExecutePaymentModel.fromJson(jsonDecode(responseModel.responseJson));
      bkashQueryPaymentLoading = false;
      update();
    }
    else{
      bkashQueryPaymentLoading = false;
      update();
    }
    bkashQueryPaymentLoading = false;
    update();
  }
  //Query Payment Controller End
}