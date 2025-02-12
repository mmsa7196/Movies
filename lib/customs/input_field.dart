import 'package:flutter/material.dart';
import 'package:movies/core/class/app_colors.dart';
import 'package:movies/core/class/app_images.dart';

class InputField extends StatelessWidget {
  InputField(
      {super.key,
      required this.lable,
      this.prefixIcon,
      this.suffixIcon,
      this.isObscure = false});

  final String lable;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isObscure;
  @override
  Widget build(BuildContext context) {
    return TextField(
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
