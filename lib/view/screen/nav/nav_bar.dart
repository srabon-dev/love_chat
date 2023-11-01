import 'package:chat_app/utils/constants/app_colors.dart';
import 'package:chat_app/view/screen/chat/chat_screen.dart';
import 'package:chat_app/view/screen/home/home_screen.dart';
import 'package:chat_app/view/screen/profile/profile_screen.dart';
import 'package:chat_app/view/screen/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  var bottomNavIndex = 0;

  List<Widget> screens = [
    const HomeScreen(),
    ChatScreen(),
    const ProfileScreen(),
    const SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    final Brightness brightness = MediaQuery.of(context).platformBrightness;
    final bool isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      body: screens[bottomNavIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: isDarkMode? AppColors.black100 : AppColors.white100,
        color: AppColors.pink100,
        onTap: (index){
          bottomNavIndex = index;
          setState(() {});
        },
        items: const [
          Icon(Icons.home,color: AppColors.white100,),
          Icon(Icons.message,color: AppColors.white100,),
          Icon(Icons.person,color: AppColors.white100,),
          Icon(Icons.settings,color: AppColors.white100,),
        ],
      ),
    );
  }
}