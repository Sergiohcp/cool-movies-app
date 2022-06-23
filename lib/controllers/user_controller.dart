import 'package:coolmovies/mappers/user_mappers.dart';
import 'package:coolmovies/models/user.dart';
import 'package:coolmovies/repositories/user_repository.dart';
import 'package:get/get.dart';

class UserController {
  final UserRepository userRepository;
  final _user = User().obs;
  var _isUserLoading = false.obs;

  UserController({required this.userRepository});

  bool get isUserLoading => _isUserLoading.value;
  User get user => _user.value;

  void setUserLoading(bool value) => _isUserLoading.value = value;
  void setUser(User value) => _user.value = value;

  Future createUser(String name) async {
    try {
      setUserLoading(true);
      var response = await this.userRepository.createUser(name);
      print('response: $response');
      final userMapped = createUserMapper(response);
      print('userMapped: $userMapped');
      setUser(User.createUser(userMapped));
    } finally {
      setUserLoading(false);
    }
  }
}
