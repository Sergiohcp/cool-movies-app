import 'package:coolmovies/api/cm_api.dart';
import 'package:coolmovies/repositories/user_repository.dart';
import 'package:get/get.dart';

import '../controllers/user_controller.dart';

class ListMoviesBinding implements Bindings {
  @override
  void dependencies() {
    final userRepository = UserRepository(cmApi: cmApi);
    Get.lazyPut<UserController>(
        () => UserController(userRepository: userRepository));
  }
}
