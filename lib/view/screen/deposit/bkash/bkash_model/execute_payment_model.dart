import 'dart:convert';

ExecutePaymentModel executePaymentModelFromJson(String str) => ExecutePaymentModel.fromJson(json.decode(str));

String executePaymentModelToJson(ExecutePaymentModel data) => json.encode(data.toJson());

class ExecutePaymentModel {
  String? statusCode;
  String? statusMessage;
  String? paymentId;
  String? payerReference;
  String? customerMsisdn;
  String? trxId;
  String? amount;
  String? transactionStatus;
  String? paymentExecuteTime;
  String? currency;
  String? intent;
  String? merchantInvoiceNumber;

  ExecutePaymentModel({
    this.statusCode,
    this.statusMessage,
    this.paymentId,
    this.payerReference,
    this.customerMsisdn,
    this.trxId,
    this.amount,
    this.transactionStatus,
    this.paymentExecuteTime,
    this.currency,
    this.intent,
    this.merchantInvoiceNumber,
  });

  factory ExecutePaymentModel.fromJson(Map<String, dynamic> json) => ExecutePaymentModel(
    statusCode: json["statusCode"],
    statusMessage: json["statusMessage"],
    paymentId: json["paymentID"],
    payerReference: json["payerReference"],
    customerMsisdn: json["customerMsisdn"],
    trxId: json["trxID"],
    amount: json["amount"],
    transactionStatus: json["transactionStatus"],
    paymentExecuteTime: json["paymentExecuteTime"],
    currency: json["currency"],
    intent: json["intent"],
    merchantInvoiceNumber: json["merchantInvoiceNumber"],
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "statusMessage": statusMessage,
    "paymentID": paymentId,
    "payerReference": payerReference,
    "customerMsisdn": customerMsisdn,
    "trxID": trxId,
    "amount": amount,
    "transactionStatus": transactionStatus,
    "paymentExecuteTime": paymentExecuteTime,
    "currency": currency,
    "intent": intent,
    "merchantInvoiceNumber": merchantInvoiceNumber,
  };
}
