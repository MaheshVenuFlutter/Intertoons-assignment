import 'package:get/get.dart';
import 'package:need_to/controller/cart_controller.dart';
import 'package:need_to/repository/cartRepo.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controller/category_controller.dart';
import '../controller/data_controller.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);

  //repo

  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));

  //controllers
  Get.lazyPut(() => DataController());

  Get.lazyPut(() => CategoryController());

  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}
