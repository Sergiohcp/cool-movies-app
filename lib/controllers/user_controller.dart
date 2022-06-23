import 'package:coolmovies/mappers/user_mappers.dart';
import 'package:coolmovies/models/local_storage.dart';
import 'package:coolmovies/models/user.dart';
import 'package:coolmovies/repositories/user_repository.dart';
import 'package:coolmovies/utils/user_utils.dart';
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
      final userMapped = createUserMapper(response.data);
      setUser(User.createUser(userMapped));
      LocalStorage.setItem("user_id", userMapped['id']);
      Get.offAllNamed('/ListMovie');
    } finally {
      setUserLoading(false);
    }
  }

  Future currentUser() async {
    try {
      setUserLoading(true);
      var response = await this.userRepository.allUsers();
      final userId = await LocalStorage.getItem('user_id');
      final currentUserMapped = currentUserMapper(response.data, userId);
      setUser(User.createUser(currentUserMapped));
    } finally {
      setUserLoading(false);
    }
  }

  Future logout() async {
    userReset();
  }
}
