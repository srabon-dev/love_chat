import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

MessageModel messageModelFromJson(String str) => MessageModel.fromJson(json.decode(str));

String messageModelToJson(MessageModel data) => json.encode(data.toJson());

class MessageModel {
  final String senderId;
  final String senderEmail;
  final String receiverId;
  final String message;
  final Timestamp timeStamp;

  MessageModel({
    required this.senderId,
    required this.senderEmail,
    required this.receiverId,
    required this.message,
    required this.timeStamp,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
    senderId: json["senderId"],
    senderEmail: json["senderEmail"],
    receiverId: json["receiverrId"],
    message: json["message"],
    timeStamp: json["timeStamp"],
  );

  Map<String, dynamic> toJson() => {
    "senderId": senderId,
    "senderEmail": senderEmail,
    "receiverId": receiverId,
    "message": message,
    "timeStamp": timeStamp,
  };
}
