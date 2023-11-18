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
  final bool isImage;
  final String imageUrl;

  MessageModel({
    required this.senderId,
    required this.senderEmail,
    required this.receiverId,
    required this.message,
    required this.timeStamp,
    required this.isImage,
    required this.imageUrl
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
    senderId: json["senderId"],
    senderEmail: json["senderEmail"],
    receiverId: json["receiverId"],
    message: json["message"],
    timeStamp: json["timeStamp"],
    isImage: json["isImage"],
    imageUrl: json["imageUrl"],
  );

  Map<String, dynamic> toJson() => {
    "senderId": senderId,
    "senderEmail": senderEmail,
    "receiverId": receiverId,
    "message": message,
    "timeStamp": timeStamp,
    "isImage": isImage,
    "imageUrl": imageUrl,
  };
}
