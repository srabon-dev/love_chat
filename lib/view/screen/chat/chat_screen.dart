import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/core/app_route.dart';
import 'package:chat_app/utils/constants/app_colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: false,
          elevation: 10,
          title: Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Text("Chat".tr),
          ),
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                StreamBuilder<QuerySnapshot>(
                  stream: firebaseFirestore.collection('user').snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something went wrong'.tr);
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text("Loading...".tr);
                    }
                    return Expanded(
                      child: ListView(
                        children: snapshot.data!.docs
                            .map((DocumentSnapshot document) {
                          Map<String, dynamic> data =
                              document.data()! as Map<String, dynamic>;
                          if(firebaseAuth.currentUser?.email != data['email']){
                            return GestureDetector(
                              onTap: () {
                                Get.toNamed(AppRoute.messageScreen,
                                    arguments: [data['email'], data['uid']]);
                              },
                              child: ListTile(
                                title: Text(
                                  data['email'] ?? "",
                                  maxLines: 1,
                                ),
                                subtitle: Text(
                                  data['phone'] ?? "",
                                  maxLines: 1,
                                ),
                                leading: SizedBox(
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
                            );
                          }else{
                            return const SizedBox();
                          }
                        }).toList(),
                      ),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
