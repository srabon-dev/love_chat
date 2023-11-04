import 'package:chat_app/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key, required this.text, this.onTap, required this.isIcon, this.image});

  final String text;
  final VoidCallback? onTap;
  final bool isIcon;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
        padding: const EdgeInsets.only(left: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.pink100),
        ),
        child: isIcon? Row(
          children: [
            SvgPicture.asset(image??""),
            const SizedBox(width: 5,),
            Text(text.tr, style: Theme.of(context).textTheme.labelMedium)
          ],
        ):Align(
          alignment: Alignment.centerLeft,
          child: Text(
            text.tr,
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
      ),
    );
  }
}
