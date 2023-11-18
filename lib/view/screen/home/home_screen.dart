import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/core/app_route.dart';
import 'package:chat_app/utils/constants/app_colors.dart';
import 'package:chat_app/utils/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Brightness brightness = MediaQuery.of(context).platformBrightness;
    final bool isDarkMode = brightness == Brightness.dark;
    return SafeArea(
      top: true,
      child: Scaffold(
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  ListTile(
                    leading: SizedBox(
                      height: 50,
                      width: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: CachedNetworkImage(
                          imageUrl:
                              "https://www.pngall.com/wp-content/uploads/5/Profile-Male-PNG.png",
                          fit: BoxFit.fill,
                          errorWidget: (context, url, error) => const Icon(
                            Icons.person,
                            color: AppColors.pink100,
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      "Srabon Ray",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    subtitle: const Text("01755788231"),
                    trailing: Icon(
                      Icons.notifications_rounded,
                      size: 25,
                      color:
                          isDarkMode ? AppColors.white100 : AppColors.black100,
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Text(
                    "Current Balance",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontSize: 18),
                  ),
                  Text(
                    "BDT 24000.6578",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontSize: 28),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            GestureDetector(
                              onTap:()=>Get.toNamed(AppRoute.depositScreen),
                              child: Container(
                                height: 60,
                                width: 80,
                                decoration: BoxDecoration(
                                  border: Border.all(color: isDarkMode ? AppColors.white100 : AppColors.black100,width: 3),
                                  borderRadius: BorderRadius.circular(12)
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Image.asset(AppImages.deposit,color: isDarkMode ? AppColors.white100 : AppColors.black100,),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 5,),
                            Text("Deposit",style: Theme.of(context).textTheme.titleMedium,)
                          ],
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: (){
                                
                              },
                              child: Container(
                                height: 60,
                                width: 80,
                                decoration: BoxDecoration(
                                    border: Border.all(color: isDarkMode ? AppColors.white100 : AppColors.black100,width: 3),
                                    borderRadius: BorderRadius.circular(12)
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Image.asset(AppImages.withdrew,color: isDarkMode ? AppColors.white100 : AppColors.black100,),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 5,),
                            Text("Withdrew",style: Theme.of(context).textTheme.titleMedium,)
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
