import 'package:coolmovies/models/local_storage.dart';
import 'package:get/get.dart';

void userReset() {
  LocalStorage.setItem("user_id", "");
  Get.offNamed('/CreateUser');
}
