import 'package:chat_app/utils/constants/app_images.dart';
import 'package:chat_app/view/widgets/custom_container/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {

  bool lang = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getShareData();
  }

  Future<void> getShareData() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    lang = sharedPreferences.getBool('lang') ?? true;
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          centerTitle: false,
          title: Text("Change Language".tr),
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: GestureDetector(
                      onTap: (){
                        Get.updateLocale(const Locale("bn", "BD")).then((value) async {
                          SharedPreferences sharePreference = await SharedPreferences.getInstance();
                          sharePreference.setBool("lang", false);
                          Get.snackbar("Bangla", "Language Changed Successfully");
                          setState(() {
                            getShareData();
                          });
                        });
                      },
                      child: CustomContainer(
                        text: "Bangla",
                        isIcon: true,
                        image: AppImages.translate,
                        checkIcon: lang? false : true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: GestureDetector(
                      onTap: (){
                        Get.updateLocale(const Locale("en", "US")).then((value) async {
                          SharedPreferences sharePreference = await SharedPreferences.getInstance();
                          sharePreference.setBool("lang", true);
                          Get.snackbar("English", "Language Changed Successfully");
                          setState(() {
                            getShareData();
                          });
                        });
                      },
                      child: CustomContainer(
                        text: "English",
                        isIcon: true,
                        image: AppImages.translate,
                        checkIcon: lang? true : false
                      ),
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
