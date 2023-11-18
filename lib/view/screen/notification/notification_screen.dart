import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        elevation: 10,
        title: Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: Text("Notification".tr),
        ),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return FutureBuilder<DocumentSnapshot>(
            future: firebaseFirestore.collection('user').doc(firebaseAuth.currentUser?.uid??"").get(),
            builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot){
              if (snapshot.hasError) {
                return Center(child: Text('Something went wrong'.tr));
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: Text("Loading...".tr));
              }
              Map<String,dynamic> userData = snapshot.data?.data() as Map<String, dynamic>;
              return const SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [

                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
