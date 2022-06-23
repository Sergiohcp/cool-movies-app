import 'package:coolmovies/api/cm_api.dart';
import 'package:coolmovies/controllers/reviews_controller.dart';
import 'package:coolmovies/repositories/reviews_repository.dart';
import 'package:coolmovies/repositories/user_repository.dart';
import 'package:get/get.dart';

import '../controllers/user_controller.dart';

class ReviewsBinding implements Bindings {
  @override
  void dependencies() {
    final userRepository = UserRepository(cmApi: cmApi);
    final reviewsRepository = ReviewsRepository(cmApi: cmApi);
    Get.lazyPut<UserController>(
        () => UserController(userRepository: userRepository));
    Get.lazyPut<ReviewsController>(
        () => ReviewsController(reviewsRepository: reviewsRepository));
  }
}
