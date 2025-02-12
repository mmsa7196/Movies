import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:movies/core/class/app_colors.dart';
import 'package:movies/core/class/app_images.dart';
import 'package:movies/customs/input_field.dart';
import 'package:movies/customs/lang_mode_btn.dart';
import 'package:movies/screen/logIn_Screen.dart';
import 'package:overlapped_carousel/overlapped_carousel.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = "Register";

  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Container(
              height: 94,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) =>
                      Image.asset(AppImages.avatars[index]),
                  itemCount: AppImages.avatars.length),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 12),
              child: Text(
                "Avatar",
                textAlign: TextAlign.center,
              ),
            ),
            InputField(
              lable: "Name",
              prefixIcon: Image.asset(AppImages.nameIcon),
            ),
            SizedBox(
              height: 24,
            ),
            InputField(
              lable: "Email",
              prefixIcon: Image.asset(AppImages.emailIcon),
            ),
            SizedBox(
              height: 24,
            ),
            InputField(
              lable: "Password",
              prefixIcon: Image.asset(AppImages.passwordIcon),
              suffixIcon: Icon(
                Icons.visibility_off_rounded,
                color: AppColors.text,
              ),
            ),
            SizedBox(
              height: 24,
            ),
            InputField(
              lable: "Confirm Password",
              prefixIcon: Image.asset(AppImages.passwordIcon),
              suffixIcon: Icon(
                Icons.visibility_off_rounded,
                color: AppColors.text,
              ),
            ),
            SizedBox(
              height: 24,
            ),
            InputField(
              lable: "Phone Number",
              prefixIcon: Image.asset(AppImages.phoneIcon),
            ),
            SizedBox(
              height: 24,
            ),
            ElevatedButton(
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    "Create Account",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: AppColors.primary),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 17, bottom: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already Have Account ?",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 14),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, LoginScreen.routeName);
                    },
                    child: Text(
                      "Login",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 14, color: AppColors.button),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LangModeBtn(
                  mode: true,
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
