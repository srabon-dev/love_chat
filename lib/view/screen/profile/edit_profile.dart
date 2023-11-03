import 'dart:io';
import 'package:chat_app/utils/constants/app_colors.dart';
import 'package:chat_app/view/screen/profile/profile_controller/profile_controller.dart';
import 'package:chat_app/view/widgets/custom_text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  Map<String, dynamic>? data;
  @override
  void initState() {
    Get.put(ProfileController());
    data = Get.arguments;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            centerTitle: false,
            title: Text("Edit Profile".tr),
          ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: GetBuilder<ProfileController>(
                builder: (controller) {
                  return Column(
                    children: [
                      const SizedBox(height: 20,),
                      GestureDetector(
                        onTap: (){
                          controller.openPhotoGallery();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            border: Border.all(color: AppColors.pink100,width: 5),
                          ),
                          child: ClipRRect(borderRadius: BorderRadius.circular(100),
                            child: controller.image != null?
                            Image.file(File(controller.image!.path).absolute,fit: BoxFit.fill,):
                            const Icon(Icons.person,size: 100,color: AppColors.pink100,),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Text("Change Profile".tr,style: Theme.of(context).textTheme.labelLarge,),
                      const SizedBox(
                        height: 24,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Name".tr,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CustomTextField(
                        controller: controller.nameController,
                        hintText: data?['name']??"Name",
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Phone Number".tr,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CustomTextField(
                        controller: controller.phoneController,
                        hintText: data?['phone']??"Phone Number",
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      SizedBox(
                        width: constraints.maxWidth,
                        child: ElevatedButton(
                          onPressed: () {
                            if(controller.nameController.text == '' && controller.phoneController.text == ''){
                              if(controller.image != null){
                                controller.updatePicture();
                              }else{
                                Get.snackbar("Error", "Please Select Image");
                              }
                            }else if(controller.nameController.text != '' && controller.phoneController.text != '' && controller.image != null){
                              controller.updateProfile();
                            }else if(controller.nameController.text != '' && controller.phoneController.text != ''){
                              controller.updateNameAndPhone();
                            }else{
                              Get.snackbar("Error", "Please Enter Name And Phone");
                            }
                          },
                          child: controller.isLoading? const Center(child: CircularProgressIndicator(color: AppColors.white100,),) : Text("Save".tr),
                        ),
                      ),
                    ],
                  );
                }
              ),
            );
          },
        ),
      ),
    );
  }
}
