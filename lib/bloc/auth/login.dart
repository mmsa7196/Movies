import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:movies/bloc/states/auth/login_states.dart';
import 'package:movies/model/registor_model.dart';

class LogInUser extends Cubit<LogInStates> {
  DataUser? user;
  LogInUser() : super(LogInInitState()) {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    // modelU = PostUserModel(
    //   name: nameController.text,
    //   email: emailController.text,
    //   password: passwordController.text,
    //   confirmPassword: confirmPasswordController.text,
    //   phone: passwordController.text,
    //   avaterId: avaterId,
    // );
  }

  late TextEditingController emailController;
  late TextEditingController passwordController;
  var formKey = GlobalKey<FormState>();
//  late PostUserModel modelU;

  void logIn() async {
    if (formKey.currentState!.validate()) {
      try {
        emit(LogInLoadingState());
        emailController = emailController;
        passwordController = passwordController;
        // modelU = PostUserModel(
        //   name: nameController.text,
        //   email: emailController.text,
        //   password: passwordController.text,
        //   confirmPassword: confirmPasswordController.text,
        //   phone: phoneController.text,
        //   avaterId: avaterId,
        // );
        Uri url = Uri.parse("https://route-movie-apis.vercel.app/auth/login");

        //   String requestBody = jsonEncode(modelU.toJson());

        final response = await http.post(
          url,
          body: {
            "email": emailController.text,
            "password": passwordController.text
          },
        );
        if (response.statusCode >= 200 && response.statusCode < 300) {
          //  var json = jsonDecode(response.body);

          //  SharedPreferences shPref = await SharedPreferences.getInstance();
          // shPref.setString("email", user!.email.toString());
          emit(LogInSuccessState());
        } else {
          print("Error : ${response.body}");
          emit(LogInErrorState());
        }
      } catch (e) {
        print("Exception: $e");
        emit(LogInErrorState());
      }
    }
  }
}
