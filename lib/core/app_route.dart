import 'package:chat_app/view/screen/auth/forget/forget_screen.dart';
import 'package:chat_app/view/screen/auth/login/login_screen.dart';
import 'package:chat_app/view/screen/auth/phone_auth/login/phone_auth.dart';
import 'package:chat_app/view/screen/auth/phone_auth/otp/otp_screen.dart';
import 'package:chat_app/view/screen/auth/register/register_screen.dart';
import 'package:chat_app/view/screen/change_password/change_password_screen.dart';
import 'package:chat_app/view/screen/chat/chat_screen.dart';
import 'package:chat_app/view/screen/deposit/bkash/bkash_check_out.dart';
import 'package:chat_app/view/screen/deposit/bkash/bkash_payment.dart';
import 'package:chat_app/view/screen/deposit/deposit_screen.dart';
import 'package:chat_app/view/screen/deposit/stripe/stripe_payment_success.dart';
import 'package:chat_app/view/screen/home/home_screen.dart';
import 'package:chat_app/view/screen/language/languages_screen.dart';
import 'package:chat_app/view/screen/message/message_screen.dart';
import 'package:chat_app/view/screen/nav/nav_bar.dart';
import 'package:chat_app/view/screen/notification/notification_screen.dart';
import 'package:chat_app/view/screen/onboarding/onboarding_screen.dart';
import 'package:chat_app/view/screen/profile/edit_profile.dart';
import 'package:chat_app/view/screen/profile/profile_screen.dart';
import 'package:chat_app/view/screen/settings/settings_screen.dart';
import 'package:chat_app/view/screen/splash/splash_screen.dart';
import 'package:get/get.dart';

class AppRoute{
  static const String splashScreen = "/splash_screen";
  static const String loginScreen = "/login_screen";
  static const String registerScreen = "/register_screen";
  static const String forgetScreen = "/forget_screen";
  static const String profileScreen = "/profile_screen";
  static const String editProfile = "/edit_profile";
  static const String homeScreen = "/home_screen";
  static const String settingsScreen = "/settings_screen";
  static const String navBar = "/nav_bar";
  static const String chatScreen = "/chat_screen";
  static const String messageScreen = "/message_screen";
  static const String onboardingScreen = "/onboarding_screen";
  static const String phoneAuth = "/phone_auth";
  static const String otpScreen = "/otp_screen";
  static const String languageScreen = "/languages_screen";
  static const String changePasswordScreen = "/change_password_screen";
  static const String depositScreen = "/deposit_screen";
  static const String bkashCheckOutScreen = "/bkash_check_out";
  static const String bkashPaymentScreen = "/bkash_payment";
  static const String stripePaymentSuccessScreen = "/stripe_payment_success";
  static const String notificationScreen = "/notification_screen";

  static List<GetPage> routes = [
    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(name: loginScreen, page: () => const LoginScreen()),
    GetPage(name: registerScreen, page: () => const RegisterScreen()),
    GetPage(name: forgetScreen, page: () => const ForgetScreen()),
    GetPage(name: profileScreen, page: () => const ProfileScreen()),
    GetPage(name: editProfile, page: () => const EditProfile()),
    GetPage(name: homeScreen, page: () => const HomeScreen()),
    GetPage(name: settingsScreen, page: () => const SettingsScreen()),
    GetPage(name: navBar, page: () => const NavBar()),
    GetPage(name: chatScreen, page: () => const ChatScreen()),
    GetPage(name: messageScreen, page: () => const MessageScreen()),
    GetPage(name: onboardingScreen, page: () => const OnboardingScreen()),
    GetPage(name: phoneAuth, page: () => const PhoneAuth()),
    GetPage(name: otpScreen, page: () => const OtpScreen()),
    GetPage(name: languageScreen, page: () => const LanguageScreen()),
    GetPage(name: changePasswordScreen, page: () => const ChangePasswordScreen()),
    GetPage(name: depositScreen, page: () => const DepositScreen()),
    GetPage(name: bkashCheckOutScreen, page: () => const BkashCheckOutScreen()),
    GetPage(name: bkashPaymentScreen, page: () => const BkashPaymentScreen()),
    GetPage(name: stripePaymentSuccessScreen, page: () => const StripePaymentSuccessScreen()),
    GetPage(name: notificationScreen, page: () => const NotificationScreen()),
  ];
}


