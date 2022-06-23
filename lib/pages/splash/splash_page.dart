import 'package:coolmovies/core/cm_colors.dart';
import 'package:coolmovies/core/cm_images.dart';
import 'package:coolmovies/models/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void verifyUserId() async {
    final userId = await LocalStorage.getItem('user_id');
    Future.delayed(Duration(seconds: 3)).then((_) => Get.offAllNamed(
        userId != null && !userId.isEmpty ? '/CreateUser' : '/CreateUser'));
  }

  @override
  void initState() {
    verifyUserId();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: CMColors.white),
        child: Center(
          child: Image.asset(
            CMImages.logo,
            scale: 2,
          ),
        ),
      ),
    );
  }
}
