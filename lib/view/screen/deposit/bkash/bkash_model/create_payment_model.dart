// To parse this JSON data, do
//
//     final createPaymentModel = createPaymentModelFromJson(jsonString);

import 'dart:convert';

CreatePaymentModel createPaymentModelFromJson(String str) => CreatePaymentModel.fromJson(json.decode(str));

String createPaymentModelToJson(CreatePaymentModel data) => json.encode(data.toJson());

class CreatePaymentModel {
  String? statusCode;
  String? statusMessage;
  String? paymentId;
  String? bkashUrl;
  String? callbackUrl;
  String? successCallbackUrl;
  String? failureCallbackUrl;
  String? cancelledCallbackUrl;
  String? amount;
  String? intent;
  String? currency;
  String? paymentCreateTime;
  String? transactionStatus;
  String? merchantInvoiceNumber;

  CreatePaymentModel({
    this.statusCode,
    this.statusMessage,
    this.paymentId,
    this.bkashUrl,
    this.callbackUrl,
    this.successCallbackUrl,
    this.failureCallbackUrl,
    this.cancelledCallbackUrl,
    this.amount,
    this.intent,
    this.currency,
    this.paymentCreateTime,
    this.transactionStatus,
    this.merchantInvoiceNumber,
  });

  factory CreatePaymentModel.fromJson(Map<String, dynamic> json) => CreatePaymentModel(
    statusCode: json["statusCode"],
    statusMessage: json["statusMessage"],
    paymentId: json["paymentID"],
    bkashUrl: json["bkashURL"],
    callbackUrl: json["callbackURL"],
    successCallbackUrl: json["successCallbackURL"],
    failureCallbackUrl: json["failureCallbackURL"],
    cancelledCallbackUrl: json["cancelledCallbackURL"],
    amount: json["amount"],
    intent: json["intent"],
    currency: json["currency"],
    paymentCreateTime: json["paymentCreateTime"],
    transactionStatus: json["transactionStatus"],
    merchantInvoiceNumber: json["merchantInvoiceNumber"],
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "statusMessage": statusMessage,
    "paymentID": paymentId,
    "bkashURL": bkashUrl,
    "callbackURL": callbackUrl,
    "successCallbackURL": successCallbackUrl,
    "failureCallbackURL": failureCallbackUrl,
    "cancelledCallbackURL": cancelledCallbackUrl,
    "amount": amount,
    "intent": intent,
    "currency": currency,
    "paymentCreateTime": paymentCreateTime,
    "transactionStatus": transactionStatus,
    "merchantInvoiceNumber": merchantInvoiceNumber,
  };
}
