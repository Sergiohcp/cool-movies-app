import 'package:coolmovies/api/cm_api.dart';
import 'package:coolmovies/controllers/movies_controle.dart';
import 'package:coolmovies/repositories/movies_repository.dart';
import 'package:coolmovies/repositories/user_repository.dart';
import 'package:get/get.dart';

import '../controllers/user_controller.dart';

class ListMoviesBinding implements Bindings {
  @override
  void dependencies() {
    final userRepository = UserRepository(cmApi: cmApi);
    final moviesRepository = MoviesRepository(cmApi: cmApi);
    Get.lazyPut<UserController>(
        () => UserController(userRepository: userRepository));
    Get.lazyPut<MoviesController>(
        () => MoviesController(moviesRepository: moviesRepository));
  }
}
