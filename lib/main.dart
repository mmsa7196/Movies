import 'package:flutter/material.dart';
import 'package:movies/core/class/app_rout.dart';
import 'package:movies/core/static/app_theme.dart';
import 'package:movies/function/check_auth.dart';
import 'package:movies/routs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final auth = await CheckAuth.init();
  runApp(MyApp(
    auth: auth,
  ));
}

class MyApp extends StatelessWidget {
  final CheckAuth auth;
  const MyApp({super.key, required this.auth});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      initialRoute: auth.skipOnBoarding == false
          ? AppRouts.onBoarding
          : auth.isLogin == false
              ? AppRouts.login
              : AppRouts.bottonNavigator,
      routes: routs,
    );
  }
}
