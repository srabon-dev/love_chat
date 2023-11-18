import 'dart:convert';
import 'dart:typed_data';
import 'package:chat_app/model/api_response_model.dart';
import 'package:http/http.dart' as http;

class BkashCheckoutRepo {

  Future<ApiResponseModel> bkashPaymentGrantTokenGenerate() async {
    final response = await http.post(
      Uri.parse("https://tokenized.sandbox.bka.sh/v1.2.0-beta/tokenized/checkout/token/grant"),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "username": "sandboxTokenizedUser02",
        "password": "sandboxTokenizedUser02@12345"
      },
      body: Uint8List.fromList(
        utf8.encode(
          jsonEncode(
            {
              "app_key": "4f6o0cjiki2rfm34kfdadl1eqq",
              "app_secret":
              "2is7hdktrekvrbljjh44ll3d9l1dtjo4pasmjvs5vl5qr3fug4b",
            },
          ),
        ),
      ),
    );
    if (response.statusCode == 200) {
      return ApiResponseModel(200, 'Success', response.body);
    } else if (response.statusCode == 201) {
      return ApiResponseModel(201, 'Success', response.body);
    } else {
      return ApiResponseModel(response.statusCode, 'Error', response.body);
    }
  }

  Future<ApiResponseModel> bkashCreatePaymentResponse({required String idToken, required String amount}) async {
    final response = await http.post(
      Uri.parse(
          "https://tokenized.sandbox.bka.sh/v1.2.0-beta/tokenized/checkout/create"),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": idToken,
        "X-App-Key": "4f6o0cjiki2rfm34kfdadl1eqq",
      },
      body: Uint8List.fromList(
        utf8.encode(
          jsonEncode(
            {
              "mode": "0011",
              "payerReference": "01770618576",
              "callbackURL": "https://bkash.com",
              "amount": amount,
              "currency": "BDT",
              "intent": "sale",
              "merchantInvoiceNumber": "3434456456454654"
            },
          ),
        ),
      ),
    );

    if (response.statusCode == 200) {
      return ApiResponseModel(response.statusCode, 'Success', response.body);
    } else if (response.statusCode == 201) {
      return ApiResponseModel(response.statusCode, 'Success', response.body);
    } else {
      return ApiResponseModel(response.statusCode, 'Error', response.body);
    }
  }

  Future<ApiResponseModel> bkashExecutePaymentResponse({required String paymentID, required String idToken,}) async {
    final response = await http.post(
      Uri.parse(
          "https://tokenized.sandbox.bka.sh/v1.2.0-beta/tokenized/checkout/execute"),
      headers: {
        "Accept": "application/json",
        "Authorization": idToken,
        "X-App-Key": "4f6o0cjiki2rfm34kfdadl1eqq",
      },
      body: Uint8List.fromList(
        utf8.encode(
          jsonEncode(
            {
              "paymentID": paymentID
            },
          ),
        ),
      ),
    );

    if (response.statusCode == 200) {
      return ApiResponseModel(response.statusCode, 'Success', response.body);
    } else if (response.statusCode == 201) {
      return ApiResponseModel(response.statusCode, 'Success', response.body);
    } else {
      return ApiResponseModel(response.statusCode, 'Error', response.body);
    }
  }

  Future<ApiResponseModel> bkashQueryPaymentResponse({required String paymentID, required String idToken,}) async {
    final response = await http.post(
      Uri.parse(
          "https://tokenized.sandbox.bka.sh/v1.2.0-beta/tokenized/checkout/payment/status"),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": idToken,
        "X-App-Key": "4f6o0cjiki2rfm34kfdadl1eqq",
      },
      body: Uint8List.fromList(
        utf8.encode(
          jsonEncode(
            {
              "paymentID": paymentID
            },
          ),
        ),
      ),
    );

    if (response.statusCode == 200) {
      return ApiResponseModel(response.statusCode, 'Success', response.body);
    } else if (response.statusCode == 201) {
      return ApiResponseModel(response.statusCode, 'Success', response.body);
    } else {
      return ApiResponseModel(response.statusCode, 'Error', response.body);
    }
  }}
