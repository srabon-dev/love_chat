import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/core/app_route.dart';
import 'package:chat_app/utils/constants/app_colors.dart';
import 'package:chat_app/view/widgets/custom_container/custom_container.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
          title: Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Text("Profile".tr),
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
                return SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          border: Border.all(color: AppColors.pink100,width: 5),
                        ),
                        child: ClipRRect(borderRadius: BorderRadius.circular(100),
                          child: CachedNetworkImage(
                            imageUrl: userData['imageUrl']??'https://www.pngall.com/wp-content/uploads/5/Profile-Male-PNG.png',
                            fit: BoxFit.fill,
                            errorWidget: (context, url, error) => const Icon(Icons.person,size: 100,color: AppColors.pink100,),
                          ),
                        ),
                      ),
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
                      CustomContainer(text: userData['name']?? "Name", isIcon: false,),
                      const SizedBox(
                        height: 12,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Email".tr,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CustomContainer(text: userData['email'] ?? "Email", isIcon: false,),
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
                      CustomContainer(text: userData['phone'] ?? "Phone", isIcon: false,),
                      const SizedBox(
                        height: 24,
                      ),
                      SizedBox(
                        width: constraints.maxWidth,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.toNamed(AppRoute.editProfile,arguments: userData);
                          },
                          child: Text("Edit".tr),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
