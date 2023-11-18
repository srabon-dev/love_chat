import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/utils/constants/app_colors.dart';
import 'package:chat_app/utils/constants/app_images.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'inner_widget/chat_bubble/chat_bubble.dart';
import 'inner_widget/chat_input_field/chat_input_field.dart';
import 'inner_widget/image_chat_bubble/image_chat_bubble.dart';
import 'message_controller/chat_controller.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final TextEditingController messageController = TextEditingController();
  ScrollController scrollController = ScrollController();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Map<String,dynamic>? data;

  @override
  void initState() {
    Get.put(ChatController());
    data = Get.arguments;
    super.initState();
  }

  String readTimestamp(int timestamp) {
    var now = DateTime.now();
    var format = DateFormat('HH:mm');
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    var diff = now.difference(date);
    var time = '';

    if (diff.inSeconds <= 0 ||
        diff.inSeconds > 0 && diff.inMinutes == 0 ||
        diff.inMinutes > 0 && diff.inHours == 0 ||
        diff.inHours > 0 && diff.inDays == 0) {
      time = format.format(date);
    } else if (diff.inDays > 0 && diff.inDays < 7) {
      if (diff.inDays == 1) {
        time = '${diff.inDays} DAY AGO';
      } else {
        time = '${diff.inDays} DAYS AGO';
      }
    } else {
      if (diff.inDays == 7) {
        time = '${(diff.inDays / 7).floor()} WEEK AGO';
      } else {
        time = '${(diff.inDays / 7).floor()} WEEKS AGO';
      }
    }

    return time;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AppImages.bgChat),
                  fit: BoxFit.cover)),
          child: GetBuilder<ChatController>(
            builder: (controller) {
              return Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(top: 24,left: 10,right: 10),
                    alignment: Alignment.centerLeft,
                    decoration: const BoxDecoration(
                      color: AppColors.pink80,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: const Icon(Icons.arrow_back_ios_new,
                              size: 18, color: AppColors.white100),
                        ),
                        Expanded(
                          child: ListTile(
                            leading: CircleAvatar(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(18),
                                child: CachedNetworkImage(
                                  imageUrl: data?['imageUrl']== ''?"https://www.pngall.com/wp-content/uploads/5/Profile-Male-PNG.png":data?['imageUrl'],
                                  fit: BoxFit.fill,
                                  errorWidget: (context, url, error) =>
                                  const Icon(Icons.person),
                                ),
                              ),
                            ),
                            title: Text(data?['name']??"",maxLines: 1,style: const TextStyle(color: AppColors.white100),),
                            subtitle: Text(data?['email']??data?['phone']??"",maxLines: 1,style: const TextStyle(color: AppColors.white100),),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: StreamBuilder<QuerySnapshot>(
                      stream: controller.getMessage(userId: firebaseAuth.currentUser?.uid??"", otherUserId: data?['uid']??""),
                      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                        if(snapshot.hasError){
                          Center(child: Text("Error ${snapshot.error}"));
                        }
                        if(snapshot.connectionState == ConnectionState.waiting){
                          return const Center(child: CircularProgressIndicator(),);
                        }
                        return ListView(
                            reverse: true,
                            controller: scrollController,
                              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                            Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                            print(data);
                            // String dateTime = readTimestamp(timestampToMilliseconds(data['timeStamp']));

                            final bool sender = data['senderId'] == firebaseAuth.currentUser?.uid;
                            return data['isImage']? ImageChatBubble(imageUrl: data['imageUrl'], isMe: sender, time: "dateTime",):ReceivedMessageScreen(message: data['message']??"", isMe: sender, time: "dateTime",);
                          }).toList(),
                          );
                      },
                    ),
                  ),
                  const SizedBox(height: 10,),
                  controller.image != null?Container(
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    decoration: ShapeDecoration(
                      color: AppColors.white100,
                      shape:RoundedRectangleBorder(
                        side: const BorderSide(width: 1, color:AppColors.green100),
                        borderRadius: BorderRadius.circular(8),
                      ) ,
                    ),
                    child: Padding(
                        padding: const EdgeInsets.only(right: 16,left: 16),
                        child: Column(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 250,
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 10,
                                    left: 10,
                                    right: 10,
                                    bottom: 10,
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.file(File(controller.image?.path??"",),fit: BoxFit.contain,)),
                                  ),
                                  Positioned(
                                    top: 0,
                                    right: 0,
                                    child: IconButton(onPressed: () {
                                      controller.removeImage();
                                    }, icon: const Icon(Icons.cancel,color: Colors.red,size: 22,),),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Row(
                                    children: [
                                      SizedBox(width: 10,),
                                      Text("Image Selected"),
                                    ],
                                  ),
                                  controller.isFileUpload? const SizedBox(width: 20,height: 20,child: CircularProgressIndicator()): IconButton(onPressed: () {
                                    controller.sendImage(receiverId: data?['uid']??'');
                                  }, icon: const Icon(Icons.send,color: Colors.red,size: 20,),),
                                ],
                              ),
                            ),
                          ],
                        )
                    ),
                  ):ChatInputField(
                    controller: messageController,
                    onTap: () {
                      if (messageController.text == "") {
                      } else {
                        controller.sendMessage(receiverId: data?['uid']??'', message: messageController.text);
                        messageController.clear();
                      }
                    }, imgOnTap: () {
                    controller.openPhotoGallery();
                  },
                  ),
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}

/*String readTimestamp(int timestamp) {
  var now = DateTime.now();
  var format = DateFormat('HH:mm');
  var date = DateTime.fromMillisecondsSinceEpoch(timestamp);
  var diff = now.difference(date);
  var time = '';

  if (diff.inSeconds <= 10) {
    time = 'just now';
  } else if (diff.inMinutes <= 1) {
    time = '${diff.inSeconds}s ago';
  } else if (diff.inHours <= 1) {
    time = '${diff.inMinutes}m ago';
  } else if (date.year == now.year &&
      date.month == now.month &&
      date.day == now.day) {
    time = format.format(date);
  } else {
    time = DateFormat('d MMM, yyyy').format(date);
  }

  return time;
}

int timestampToMilliseconds(Timestamp timestamp) {
  return timestamp.millisecondsSinceEpoch;
}

class Timestamp {
  int millisecondsSinceEpoch;

  Timestamp.now()
      : millisecondsSinceEpoch = DateTime.now().millisecondsSinceEpoch;
}*/

