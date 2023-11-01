import 'package:chat_app/view/screen/message/chat_model/chat_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

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
    doc(chatRoomId).collection('message').orderBy("timeStamp", descending: false).snapshots();
  }
}