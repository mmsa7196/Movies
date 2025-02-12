import 'package:flutter/material.dart';
import 'package:movies/core/class/app_colors.dart';
import 'package:movies/core/class/app_images.dart';
import 'package:movies/customs/input_field.dart';

class ForgetPasswordScreen extends StatelessWidget {
  static const String routeName = "ForgetPass";

  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forget Password"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(AppImages.forgetImage),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: InputField(
                lable: "Email",
                prefixIcon: Image.asset(AppImages.emailIcon),
              ),
            ),
            ElevatedButton(
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: Text(
                    "Verfiy Email",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: AppColors.textThird),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
