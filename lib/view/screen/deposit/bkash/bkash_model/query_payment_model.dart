import 'dart:convert';

QueryPaymentModel queryPaymentModelFromJson(String str) => QueryPaymentModel.fromJson(json.decode(str));

String queryPaymentModelToJson(QueryPaymentModel data) => json.encode(data.toJson());

class QueryPaymentModel {
  String? statusCode;
  String? statusMessage;
  String? paymentId;
  String? mode;
  String? paymentCreateTime;
  String? amount;
  String? currency;
  String? intent;
  String? merchantInvoice;
  String? transactionStatus;
  String? verificationStatus;
  String? payerReference;
  String? agreementId;
  String? agreementStatus;
  String? agreementCreateTime;
  String? agreementExecuteTime;

  QueryPaymentModel({
    this.statusCode,
    this.statusMessage,
    this.paymentId,
    this.mode,
    this.paymentCreateTime,
    this.amount,
    this.currency,
    this.intent,
    this.merchantInvoice,
    this.transactionStatus,
    this.verificationStatus,
    this.payerReference,
    this.agreementId,
    this.agreementStatus,
    this.agreementCreateTime,
    this.agreementExecuteTime,
  });

  factory QueryPaymentModel.fromJson(Map<String, dynamic> json) => QueryPaymentModel(
    statusCode: json["statusCode"],
    statusMessage: json["statusMessage"],
    paymentId: json["paymentID"],
    mode: json["mode"],
    paymentCreateTime: json["paymentCreateTime"],
    amount: json["amount"],
    currency: json["currency"],
    intent: json["intent"],
    merchantInvoice: json["merchantInvoice"],
    transactionStatus: json["transactionStatus"],
    verificationStatus: json["verificationStatus"],
    payerReference: json["payerReference"],
    agreementId: json["agreementID"],
    agreementStatus: json["agreementStatus"],
    agreementCreateTime: json["agreementCreateTime"],
    agreementExecuteTime: json["agreementExecuteTime"],
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "statusMessage": statusMessage,
    "paymentID": paymentId,
    "mode": mode,
    "paymentCreateTime": paymentCreateTime,
    "amount": amount,
    "currency": currency,
    "intent": intent,
    "merchantInvoice": merchantInvoice,
    "transactionStatus": transactionStatus,
    "verificationStatus": verificationStatus,
    "payerReference": payerReference,
    "agreementID": agreementId,
    "agreementStatus": agreementStatus,
    "agreementCreateTime": agreementCreateTime,
    "agreementExecuteTime": agreementExecuteTime,
  };
}
