import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/core/app_route.dart';
import 'package:chat_app/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
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
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric( vertical: 20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.pink100),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Search".tr,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Column(
                    children: List.generate(
                      30,
                      (index) => GestureDetector(
                        onTap: (){
                          Get.toNamed(AppRoute.messageScreen);
                        },
                        child: ListTile(
                          title: const Text("Srabon Ray",maxLines: 1,),
                          subtitle: const Text("Hello, How are you?",maxLines: 1,),
                          leading: SizedBox(
                            height: 50,
                            width: 50,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: CachedNetworkImage(
                                imageUrl: "https://www.pngall.com/wp-content/uploads/5/Profile-Male-PNG.png",
                                fit: BoxFit.fill,
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
