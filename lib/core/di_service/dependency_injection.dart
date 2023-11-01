import 'package:chat_app/service/auth_service.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> initDependency() async{
  final sharedPreference = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreference, fenix: true);
  Get.lazyPut(() => AuthServices(sharedPreferences: Get.find()));
}