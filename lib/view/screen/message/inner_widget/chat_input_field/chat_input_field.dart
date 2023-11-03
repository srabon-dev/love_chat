import 'package:chat_app/utils/constants/app_colors.dart';
import 'package:chat_app/view/widgets/custom_text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatInputField extends StatefulWidget {
  final TextEditingController controller;
  final VoidCallback onTap;

  const ChatInputField(
      {super.key, required this.controller, required this.onTap});

  @override
  State<ChatInputField> createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      padding: MediaQuery.of(context).viewInsets,
      duration: const Duration(milliseconds: 100),
      curve: Curves.decelerate,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.white100,width: 2),
          color: AppColors.white100,
        ),
        padding: const EdgeInsets.only(bottom: 12, left: 20, right: 20),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 12),
              child: Icon(Icons.camera_alt_outlined,color: AppColors.pink100,),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 12),
              child: Icon(Icons.attach_file,color: AppColors.pink100,),
            ),

            Expanded(
                child: CustomTextField(
                  readOnly: false,
                  maxLines: 5,
                  controller: widget.controller,
                  hintText: "write your message".tr,
                ),),
            //
            //
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: GestureDetector(
                onTap: () {
                  widget.onTap();
                },
                child: const Icon(Icons.send,color: AppColors.pink100,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
