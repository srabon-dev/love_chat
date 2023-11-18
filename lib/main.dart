import 'package:chat_app/service/language_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/di_service/dependency_injection.dart' as di;
import 'package:chat_app/utils/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/app_route.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.initDependency();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  bool selectLanguage = sharedPreferences.getBool('lang')?? true;
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp(selectLanguage: selectLanguage,));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.selectLanguage});
  final bool selectLanguage;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.noTransition,
      transitionDuration: const Duration(milliseconds: 200),
      initialRoute: AppRoute.splashScreen,
      navigatorKey: Get.key,
      getPages: AppRoute.routes,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      translations: Languages(),
      locale: selectLanguage?const Locale("en" , "US") : const Locale("bn" , "BD"),
      fallbackLocale:const Locale("en" , "US"),
    );
  }
}
