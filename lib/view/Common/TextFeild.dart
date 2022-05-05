import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TsField extends StatelessWidget {
  final hintText;
  final prefixIcon;
  final suffixIcon;
  final borderColor;
  final length;
  final suffixTap;
  final obText;
  final borderRadius;
  final color;
  final TextEditingController controller;
  final focusBorderRadius;
  final FormFieldValidator validator;
  final typeOfKeyboard;
  final suffixColor;
  final onTap;
  const TsField({
    Key? key,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixTap,
    this.obText,
    this.borderRadius,
    this.focusBorderRadius,
    this.color,
    this.typeOfKeyboard,
    this.suffixColor,
    required this.validator,
    required this.controller,
    this.borderColor,
    this.length,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      onTap: onTap,
      maxLength: length,
      validator: validator,
      keyboardType: typeOfKeyboard,
      controller: controller,
      textAlign: TextAlign.justify,
      obscureText: obText,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor),
          borderRadius: BorderRadius.circular(focusBorderRadius),
        ),
        contentPadding: EdgeInsets.only(top: 1.5.h),
        border: InputBorder.none,
        prefixIcon: Icon(prefixIcon),
        hintText: hintText,
        filled: true,
        counter: Offstage(),
        fillColor: color,
        suffixIcon: GestureDetector(
          onTap: suffixTap,
          child: Icon(
            suffixIcon,
            size: 20,
            color: suffixColor,
          ),
        ),
      ),
    );
  }
}
