import 'package:coolmovies/bindinds/list_movies_binding.dart';
import 'package:coolmovies/bindinds/reviews_binding.dart';
import 'package:coolmovies/bindinds/user_binding.dart';
import 'package:coolmovies/core/cm_colors.dart';
import 'package:coolmovies/pages/createOrEditReview/create_or_edit_review_page.dart';
import 'package:coolmovies/pages/createUser/create_user_page.dart';
import 'package:coolmovies/pages/listMovies/list_movies_page.dart';
import 'package:coolmovies/pages/movieDetails/movie_details_page.dart';
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
            name: '/CreateUser',
            page: () => CreateUserPage(),
            binding: UserBinding()),
        GetPage(
            name: '/ListMovies',
            page: () => ListMoviesPage(),
            binding: ListMoviesBinding()),
        GetPage(name: '/MovieDetails', page: () => MovieDetailsPage()),
        GetPage(
            name: '/CreateOrEditReview',
            page: () => CreateOrEditReviewPage(),
            binding: ReviewsBinding()),
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
