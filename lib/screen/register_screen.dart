import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:movies/core/class/app_colors.dart';
import 'package:movies/core/class/app_images.dart';
import 'package:movies/core/class/firebase_manager.dart';
import 'package:movies/customs/input_field.dart';
import 'package:movies/customs/lang_mode_btn.dart';
import 'package:movies/screen/logIn_Screen.dart';
import 'package:overlapped_carousel/overlapped_carousel.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = "Register";

  RegisterScreen({super.key});

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController rePasswordController = TextEditingController();
    TextEditingController phoneController = TextEditingController();

    PageController _pageController =
        PageController(initialPage: 4, viewportFraction: .3);
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
          child: Form(
            key: formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 94,
                    child: PageView.builder(
                        controller: _pageController,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Image.asset(AppImages.avatars[index]);
                        },
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
                    controller: nameController,
                    validate: (value) {
                      if (value == null || value == "") {
                        return "Name is required";
                      }
                    },
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  InputField(
                    lable: "Email",
                    prefixIcon: Image.asset(AppImages.emailIcon),
                    controller: emailController,
                    validate: (value) {
                      if (value == null || value == "") {
                        return "Email is required";
                      }
                      final bool emailFormat = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value);
                      if (emailFormat == false) {
                        return "Invalid email format";
                      }
                    },
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
                    controller: passwordController,
                    validate: (value) {
                      if (value == null || value == "") {
                        return "Password is required";
                      }
                      if (passwordController.text.length <= 6) {
                        return "Password must be more than 6 character";
                      }
                    },
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
                    controller: rePasswordController,
                    validate: (value) {
                      if (value == null || value == "") {
                        return "Please confirm Password";
                      }
                      if (passwordController.text != value) {
                        return "Password hasn't match";
                      }
                    },
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  InputField(
                    lable: "Phone Number",
                    prefixIcon: Image.asset(AppImages.phoneIcon),
                    controller: phoneController,
                    validate: (value) {
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          FirebaseManager.createAccount(
                            emailAddress: emailController.text,
                            password: passwordController.text,
                            onLoading: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  backgroundColor: Colors.transparent,
                                  title: Center(
                                      child: CircularProgressIndicator(
                                    color: AppColors.button,
                                  )),
                                ),
                              );
                            },
                            onSuccess: () {
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                            onError: (massage) {
                              Navigator.pop(context);
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  backgroundColor: AppColors.primary,
                                  title: Text(
                                    "Some thing is Wrong",
                                    style: TextStyle(color: AppColors.text),
                                  ),
                                  content: Text(massage),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("OK"))
                                  ],
                                ),
                              );
                            },
                          );
                        }
                      },
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
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Login",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    fontSize: 14, color: AppColors.button),
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
      ),
    );
  }
}
