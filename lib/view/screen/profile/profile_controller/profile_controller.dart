import 'dart:io';
import 'package:chat_app/core/app_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ProfileController extends GetxController{

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  //All Controller
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  XFile? image;
  bool isLoading = false;

  Future<void> updatePicture() async{
    isLoading = true;
    update();
    try{
      Reference storage = FirebaseStorage.instance.ref('/profileImage/${firebaseAuth.currentUser?.uid??"errorUserUid"}');
      UploadTask uploadTask = storage.putFile(File(image!.path));
      await Future.value(uploadTask);
      final imageUrl = await storage.getDownloadURL();

      firebaseFirestore.collection('user').doc(firebaseAuth.currentUser?.uid??"").update(
          {
            'imageUrl' : imageUrl
          }
      ).then((value){
        isLoading = false;
        update();
        Get.snackbar("Success", "Profile Update Successful");
        Get.offAndToNamed(AppRoute.navBar);
      }).catchError((error){
        isLoading = false;
        update();
        Get.snackbar("Error", "Image Update Error");
      });
    }catch(error){
      isLoading = false;
      update();
      Get.snackbar("Error", error.toString());
    }
  }

  Future<void> updateProfile() async{
    isLoading = true;
    update();
    try{
      Reference storage = FirebaseStorage.instance.ref('/profileImage${firebaseAuth.currentUser?.uid??"errorUserUid"}');
      UploadTask uploadTask = storage.putFile(File(image!.path));
      await Future.value(uploadTask);
      final imageUrl = await storage.getDownloadURL();

      firebaseFirestore.collection('user').doc(firebaseAuth.currentUser?.uid??"").update(
          {
            'imageUrl' : imageUrl,
            'name' : nameController.text.trim(),
            'phone' : phoneController.text.trim(),
            'email' : emailController.text.trim()
          }
      ).then((value){
        isLoading = false;
        update();
        Get.snackbar("Success", "Profile Update Successful");
        Get.offAndToNamed(AppRoute.navBar);
      }).catchError((error){
        isLoading = false;
        update();
        Get.snackbar("Error", "Image Update Error");
      });
    }catch(error){
      isLoading = false;
      update();
      Get.snackbar("Error", error.toString());
    }
  }

  Future<void> updateNameAndPhone() async{
    firebaseFirestore.collection('user').doc(firebaseAuth.currentUser?.uid??"").update(
        {
          'name' : nameController.text.trim(),
          'phone' : phoneController.text.trim()
        }
    ).then((value){
      isLoading = false;
      update();
      Get.snackbar("Success", "Profile Update Successful");
      Get.offAndToNamed(AppRoute.navBar);
    }).catchError((error){
      isLoading = false;
      update();
      Get.snackbar("Error", "Image Update Error");
    });
  }

  Future<void> openPhotoGallery() async{
    try{
      final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery, maxHeight: 120, maxWidth: 120);

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
}