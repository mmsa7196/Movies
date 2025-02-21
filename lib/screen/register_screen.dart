import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/bloc/auth/register.dart';
import 'package:movies/bloc/states/auth/register_states.dart';
import 'package:movies/core/class/app_colors.dart';
import 'package:movies/core/class/app_images.dart';
import 'package:movies/core/class/app_rout.dart';
import 'package:movies/customs/input_field.dart';
import 'package:movies/customs/lang_mode_btn.dart';
import 'package:movies/function/validate/email_validate.dart';
import 'package:movies/function/validate/name_validat.dart';
import 'package:movies/function/validate/pass_validate.dart';
import 'package:movies/function/validate/phone_validate.dart';
import 'package:movies/screen/logIn_Screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    PageController _pageController =
        PageController(initialPage: 4, viewportFraction: .3);
    return BlocProvider<RegisterUser>(
      create: (context) => RegisterUser(),
      child: BlocConsumer<RegisterUser, RegisterStates>(
        listener: (context, state) {
          if (state is RegisterLoadingState) {
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
          if (state is RegisterErrorState) {
            Navigator.pop(context);
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Error"),
                content: InkWell(
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
              ),
            );
          }
          if (state is RegisterSuccessState) {
            Navigator.of(context).pushNamedAndRemoveUntil(
                AppRouts.bottonNavigator, (Route<dynamic> route) => false);
          }
        },
        builder: (context, state) {
          var bloc = BlocProvider.of<RegisterUser>(context);
          return Scaffold(
            appBar: AppBar(
              title: Text("Register"),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
                child: Form(
                  key: bloc.formKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          height: 94,
                          child: PageView.builder(
                              controller: _pageController,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                bloc.avaterId = index;
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
                          controller: bloc.nameController,
                          validate: (val) =>
                              nameValidate(bloc.nameController.text),
                          lable: "Name",
                          prefixIcon: Image.asset(AppImages.nameIcon),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        InputField(
                          controller: bloc.emailController,
                          validate: (val) =>
                              emailValidate(bloc.emailController.text),
                          lable: "Email",
                          prefixIcon: Image.asset(AppImages.emailIcon),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        InputField(
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
                        SizedBox(
                          height: 24,
                        ),
                        InputField(
                          controller: bloc.confirmPasswordController,
                          validate: (val) => passValidate(
                              bloc.confirmPasswordController.text, 8, 25,
                              isRePass: true,
                              pass: bloc.passwordController.text),
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
                          controller: bloc.phoneController,
                          validate: (val) =>
                              phoneValidate(bloc.phoneController.text),
                          lable: "Phone Number",
                          prefixIcon: Image.asset(AppImages.phoneIcon),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              bloc.register();
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
                                  Navigator.pushNamed(
                                      context, LoginScreen.routeName);
                                },
                                child: Text(
                                  "Login",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          fontSize: 14,
                                          color: AppColors.button),
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
        },
      ),
    );
  }
}
