import 'package:chat_app/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Brightness brightness = MediaQuery.of(context).platformBrightness;
    final bool isDarkMode = brightness == Brightness.dark;
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 10,
          title: Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.favorite,size: 32,color: AppColors.pink100,),
                const SizedBox(width: 5,),
                Text("Love Chat".tr,style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 28
                ),),
              ],
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20,top: 24.0),
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: AppColors.pink100,width: 3),
                ),
                child: const Icon(Icons.notifications_rounded,size: 20,color: AppColors.pink100,),
              ),
            ),
          ],
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  const SizedBox(height: 20,),
                  Container(
                    height: 300,
                    width: constraints.maxWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: isDarkMode? Border.all(color: AppColors.white100,width: 3):Border.all(color: AppColors.pink100,width: 3),
                      color:  isDarkMode? AppColors.black100 : AppColors.white100,
                      boxShadow: isDarkMode? [] :[
                        const BoxShadow(
                          offset: Offset(-4, -4),
                          blurRadius: 3,
                          spreadRadius: 2,
                          color: AppColors.black20
                        ),
                        const BoxShadow(
                          offset: Offset(4, 4),
                          blurRadius: 3,
                          spreadRadius: 2,
                          color: AppColors.black40
                        )
                      ]
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
