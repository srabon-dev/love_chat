import 'dart:io';

import 'package:chat_app/model/chat_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ChatController extends GetxController{

  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  //Store Message
  Future<void> sendMessage({required String receiverId, required String message}) async{
    final String senderId = firebaseAuth.currentUser?.uid??"";
    final String senderEmail = firebaseAuth.currentUser?.email??"";
    final Timestamp timeStamp = Timestamp.now();
    MessageModel messageModel = MessageModel(
        senderId: senderId,
        senderEmail: senderEmail,
        receiverId: receiverId,
        message: message,
        timeStamp: timeStamp,
      isImage: false,
      imageUrl: '',
    );
    List<String> ids = [senderId, receiverId];
    ids.sort();
    String chatRoomId = ids.join('_');

    //Firebase FireStore
    firebaseFirestore.collection("chat_room").
    doc(chatRoomId).collection('message').
    add(messageModel.toJson());
  }

  //Get Message
  Stream<QuerySnapshot> getMessage({required String userId, required String otherUserId}){
    List<String> ids = [userId, otherUserId];
    ids.sort();
    String chatRoomId = ids.join('_');
    return firebaseFirestore.collection("chat_room").
    doc(chatRoomId).collection('message').orderBy("timeStamp", descending: true).snapshots();
  }

  XFile? image;
  bool isFileUpload = false;
  Future<void> sendImage({required String receiverId}) async{
    isFileUpload = true;
    update();
    try{
      Reference storage = FirebaseStorage.instance.ref('/messageImage/${firebaseAuth.currentUser?.uid??"errorUserUid"}/${DateTime.now()}');
      UploadTask uploadTask = storage.putFile(File(image!.path));
      await Future.value(uploadTask);
      final imageUrl = await storage.getDownloadURL();

      final String senderId = firebaseAuth.currentUser?.uid??"";
      final String senderEmail = firebaseAuth.currentUser?.email??"";
      final Timestamp timeStamp = Timestamp.now();
      MessageModel messageModel = MessageModel(
        senderId: senderId,
        senderEmail: senderEmail,
        receiverId: receiverId,
        message: '',
        timeStamp: timeStamp,
        isImage: true,
        imageUrl: imageUrl,
      );
      List<String> ids = [senderId, receiverId];
      ids.sort();
      String chatRoomId = ids.join('_');
      firebaseFirestore.collection('chat_room').doc(chatRoomId).collection('message').add(messageModel.toJson()).then((value){
        isFileUpload = false;
        update();
        Get.snackbar("Success", "Image Send Successful");
        image = null;
        update();
      }).catchError((error){
        isFileUpload = false;
        update();
        Get.snackbar("Error", "Image Send Error");
      });
    }catch(error){
      isFileUpload = false;
      update();
      Get.snackbar("Error", error.toString());
    }
  }

  Future<void> openPhotoGallery() async{
    try{
      final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 70);
      if(pickedFile != null){
        image = XFile(pickedFile.path);
        update();
      }else{
        Get.snackbar("Error", "Image Pick Error");
      }
    }catch(error){
      Get.snackbar("Error", "Image Pick Error$error");
    }
  }

  void removeImage(){
    image = null;
    update();
  }
}