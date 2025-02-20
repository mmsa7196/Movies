import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/bloc/auth/login.dart';
import 'package:movies/bloc/states/auth/login_states.dart';
import 'package:movies/core/class/app_colors.dart';
import 'package:movies/core/class/app_images.dart';
import 'package:movies/core/class/app_rout.dart';
import 'package:movies/customs/input_field.dart';
import 'package:movies/customs/lang_mode_btn.dart';
import 'package:movies/function/validate/email_validate.dart';
import 'package:movies/function/validate/pass_validate.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "LoginScreen";
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LogInUser>(
      create: (context) => LogInUser(),
      child: Scaffold(
        body: BlocConsumer<LogInUser, LogInStates>(listener: (context, state) {
          if (state is LogInLoadingState) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                  title: Text("Loading.."),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircularProgressIndicator(),
                    ],
                  )),
            );
          }
          if (state is LogInErrorState) {
            Navigator.pop(context);
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Error"),
                content: Column(
                  children: [
                    Text("email or password is wrong"),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: AppColors.buttonRed,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(Icons.rotate_left, color: AppColors.text),
                            Text("Try again")
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          if (state is LogInSuccessState) {
            Navigator.of(context).pushNamedAndRemoveUntil(
                AppRouts.bottonNavigator, (Route<dynamic> route) => false);
          }
        }, builder: (context, state) {
          var bloc = BlocProvider.of<LogInUser>(context);

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 19),
              child: Form(
                key: bloc.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset(
                      AppImages.logo,
                      height: 250,
                    ),
                    InputField(
                      controller: bloc.emailController,
                      validate: (val) =>
                          emailValidate(bloc.emailController.text),
                      lable: "Email",
                      prefixIcon: Image.asset(AppImages.emailIcon),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 22, bottom: 17),
                      child: InputField(
                        controller: bloc.passwordController,
                        validate: (val) =>
                            passValidate(bloc.passwordController.text, 8, 25),
                        lable: "Password",
                        prefixIcon: Image.asset(AppImages.passwordIcon),
                        suffixIcon: Icon(
                          Icons.visibility_off_rounded,
                          color: AppColors.text,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRouts.forgetPass);
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
                          bloc.logIn();
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
                            Navigator.pushNamed(context, AppRouts.register);
                          },
                          child: Text(
                            "Create Account",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    fontSize: 14, color: AppColors.button),
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
                        onPressed: () {},
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
          );
        }),
      ),
    );
  }
}
