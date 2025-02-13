import 'package:flutter/material.dart';
import 'package:movies/core/class/app_colors.dart';
import 'package:movies/core/class/app_images.dart';
import 'package:movies/core/class/app_rout.dart';
import 'package:movies/core/class/firebase_manager.dart';
import 'package:movies/customs/button.dart';
import 'package:movies/customs/input_field.dart';
import 'package:movies/customs/lang_mode_btn.dart';
import 'package:movies/screen/forget_password_screen.dart';
import 'package:movies/screen/register_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "LoginScreen";

  LoginScreen({super.key});

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 19),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  AppImages.logo,
                  height: 250,
                ),
                InputField(
                  lable: "Email",
                  controller: emailController,
                  prefixIcon: Image.asset(AppImages.emailIcon),
                  validate: (value) {
                    if (value == null || value == "") {
                      return "Email is required";
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 22, bottom: 17),
                  child: InputField(
                    lable: "Password",
                    controller: passwordController,
                    prefixIcon: Image.asset(AppImages.passwordIcon),
                    suffixIcon: Icon(
                      Icons.visibility_off_rounded,
                      color: AppColors.text,
                    ),
                    validate: (value) {
                      if (value == null || value == "") {
                        return "Password is required";
                      }
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, ForgetPasswordScreen.routeName);
                    },
                    child: Text(
                      "Forget Password ?",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 14, color: AppColors.button),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 33, bottom: 22),
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        FirebaseManager.logIn(
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
                                  ),
                                ),
                              ),
                            );
                          },
                          onSuccess: () {
                            Navigator.pop(context);
                            //Navigator.pushNamed(context, AppRouts.home);
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
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      child: Text(
                        "Login",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: AppColors.textThird),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t Have Account ?",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 14),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RegisterScreen.routeName);
                      },
                      child: Text(
                        "Create Account",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontSize: 14, color: AppColors.button),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 27, bottom: 28),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Divider(
                          color: AppColors.button,
                          endIndent: 11,
                          indent: 90,
                        ),
                      ),
                      Text(
                        "OR",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: AppColors.button),
                      ),
                      Expanded(
                        child: Divider(
                          color: AppColors.button,
                          endIndent: 90,
                          indent: 11,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 33),
                  child: ElevatedButton(
                    onPressed: () {
                      FirebaseManager.signInWithGoogle();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(AppImages.googleIcon),
                          SizedBox(
                            width: 11,
                          ),
                          Text(
                            "Login with Google",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: AppColors.textThird),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LangModeBtn(mode: true),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
