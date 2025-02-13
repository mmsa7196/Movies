import 'package:flutter/material.dart';
import 'package:movies/core/class/app_colors.dart';
import 'package:movies/core/class/app_images.dart';

class InputField extends StatelessWidget {
  InputField(
      {super.key,
      required this.lable,
      required this.validate,
      this.prefixIcon,
      this.suffixIcon,
      this.controller,
      this.isObscure = false});

  final String lable;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function validate;
  final TextEditingController? controller;
  final bool isObscure;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => validate(value),
      controller: controller,
      obscureText: isObscure,
      cursorColor: AppColors.text,
      decoration: InputDecoration(
        hintText: lable,
        hintStyle: Theme.of(context).textTheme.bodyMedium,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: AppColors.greyScreen,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColors.greyScreen),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColors.greyScreen),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: AppColors.greyScreen,
          ),
        ),
      ),
    );
  }
}
