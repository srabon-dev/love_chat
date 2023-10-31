import 'package:chat_app/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    this.controller,
    this.focusNode,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.textAlignVertical = TextAlignVertical.center,
    this.textAlign = TextAlign.start,
    this.onChanged,
    this.maxLines = 1,
    this.validator,
    this.hintText,
    this.hintStyle,
    this.suffixIcon,
    this.suffixIconColor,
    this.fieldBorderRadius = 8,
    this.isPassword = false,
    this.readOnly = false,

    super.key,  this.isPrefixIcon =false
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final TextAlignVertical? textAlignVertical;
  final TextAlign textAlign;
  final int? maxLines;
  final void Function(String)? onChanged;
  final FormFieldValidator? validator;
  final String? hintText;
  final TextStyle? hintStyle;
  final Color? suffixIconColor;
  final Widget? suffixIcon;
  final double fieldBorderRadius;
  final bool isPassword;
  final bool isPrefixIcon;

  final bool readOnly;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {

  bool obscureText = true;

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      readOnly: widget.readOnly,
      controller: widget.controller,
      focusNode: widget.focusNode,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      style: Theme.of(context).textTheme.labelSmall,
      onChanged: widget.onChanged,
      maxLines: widget.maxLines,
      obscureText: widget.isPassword ? obscureText : false,
      validator: widget.validator,
      decoration: const InputDecoration().applyDefaults(Theme.of(context).inputDecorationTheme).copyWith(
        hintText: widget.hintText,
        suffixIcon: widget.isPassword ? GestureDetector(
            onTap: toggle,
            child: Padding(
              padding:const EdgeInsetsDirectional.symmetric(horizontal: 16,vertical: 14),
              child: obscureText ?
              const Icon( Icons.visibility_off_outlined) :
              const Icon( Icons.visibility_outlined),
            )
        ) : widget.suffixIcon,
        suffixIconColor: widget.suffixIconColor,
      ),
    );
  }

  void toggle() {
    setState(() {
      obscureText = !obscureText;
    });
  }
}