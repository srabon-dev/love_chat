import 'package:chat_app/utils/language/bangla.dart';
import 'package:chat_app/utils/language/english.dart';
import 'package:get/get_navigation/src/root/internacionalization.dart';

class Languages extends Translations{
  @override
  Map<String, Map<String, String>> get keys => {
    "en_US" : english,
    "bn_BD" : bangla
  };
}