import 'package:coolmovies/bindinds/user_binding.dart';
import 'package:coolmovies/core/cm_colors.dart';
import 'package:coolmovies/pages/createUser/create_user_page.dart';
import 'package:coolmovies/pages/splash/splash_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CMApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Cool Movies App',
      theme: ThemeData(
          primaryColor: CMColors.primary, brightness: Brightness.light),
      navigatorKey: Get.key,
      initialRoute: '/Splash',
      getPages: [
        GetPage(name: '/Splash', page: () => SplashPage()),
        GetPage(
            name: '/Auth',
            page: () => CreateUserPage(),
            binding: UserBinding()),
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
