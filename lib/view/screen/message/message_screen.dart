import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/utils/constants/app_colors.dart';
import 'package:chat_app/view/screen/message/controller/chat_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'chat_input_field/chat_input_field.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {

  final TextEditingController messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  void scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.extentTotal,
      duration: const Duration(milliseconds: 50),
      curve: Curves.ease,
    );
  }

  String receiverId = '';
  String receiverEmail = '';

  @override
  void initState() {
    Get.put(ChatController());
    receiverEmail = Get.arguments[0];
    receiverId = Get.arguments[1];
    super.initState();
  }

  String readTimestamp(int timestamp) {
    var now = DateTime.now();
    var format = DateFormat('HH:mm');
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var diff = now.difference(date);
    var time = '';

    if (diff.inSeconds <= 0 || diff.inSeconds > 0 && diff.inMinutes == 0 || diff.inMinutes > 0 && diff.inHours == 0 || diff.inHours > 0 && diff.inDays == 0) {
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
          color: AppColors.white100,
          child: GetBuilder<ChatController>(
            builder: (controller) {
              return Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(bottom: 18, top: 44),
                    alignment: Alignment.centerLeft,
                    decoration: const BoxDecoration(
                      color: AppColors.pink100,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: const Icon(Icons.arrow_back_ios_new,
                                size: 18, color: AppColors.white100),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: SizedBox(
                              height: 50,
                              width: 50,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: CachedNetworkImage(
                                  imageUrl:
                                  "https://www.pngall.com/wp-content/uploads/5/Profile-Male-PNG.png",
                                  fit: BoxFit.fill,
                                  errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                                ),
                              ),
                            ),
                          ),
                          Text(receiverEmail,style: const TextStyle(color: AppColors.white100),),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: StreamBuilder<QuerySnapshot>(
                      stream: controller.getMessage(userId: firebaseAuth.currentUser?.uid??"", otherUserId: receiverId),
                      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                        if(snapshot.hasError){
                          Center(child: Text("Error ${snapshot.error}"));
                        }
                        if(snapshot.connectionState == ConnectionState.waiting){
                          return const Center(child: CircularProgressIndicator(),);
                        }
                        return ListView(
                          controller: _scrollController,
                            children: snapshot.data!.docs.map((DocumentSnapshot document) {
                          Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                          print(data);
                          String dateTime = readTimestamp(timestampToMilliseconds(data['timeStamp']));

                          final bool sender = data['senderId'] == firebaseAuth.currentUser?.uid;
                          return Padding(
                            padding: EdgeInsets.only(top: 5,bottom: 5,left: sender? 30 : 5,right: sender? 5 : 30),
                            child: Align(
                              alignment: sender?Alignment.centerRight : Alignment.centerLeft,
                              child: Container(
                                //padding: sender? const EdgeInsets.only(left: 30.0) : const EdgeInsets.only(right: 30.0),
                                alignment: sender?Alignment.centerRight : Alignment.centerLeft,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: sender? AppColors.green100 : AppColors.pink100,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    mainAxisAlignment: sender? MainAxisAlignment.end : MainAxisAlignment.start,
                                    crossAxisAlignment: sender? CrossAxisAlignment.end : CrossAxisAlignment.start,
                                    children: [
                                      Align(alignment: sender?Alignment.centerRight : Alignment.centerLeft,child: Text(data['message']??"",style: const TextStyle(color: AppColors.white100),)),
                                      const SizedBox(height: 5,),
                                      Align(alignment: sender?Alignment.centerRight : Alignment.centerLeft,child: Text(dateTime,style: const TextStyle(color: AppColors.white100),)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10,),
                  ChatInputField(
                    controller: messageController,
                    onTap: () {
                      if (messageController.text == "") {
                      } else {
                        controller.sendMessage(receiverId: receiverId, message: messageController.text);
                        messageController.clear();
                        setState(() {
                        });
                      }
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

  int timestampToMilliseconds(Timestamp timestamp) {
    return timestamp.millisecondsSinceEpoch;
  }
}
