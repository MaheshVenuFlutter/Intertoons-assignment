import 'package:get/get.dart';
import 'package:need_to/controller/cart_controller.dart';
import 'package:need_to/controller/data_controller.dart';
import 'package:need_to/repository/cartRepo.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'category_controller.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() async {
    //CategoryController dependency injection//=========================
    final sharedPreferences = await SharedPreferences.getInstance();
    Get.lazyPut(() => sharedPreferences);
    Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));
    Get.put(CartController(cartRepo: Get.find()));
    Get.put(DataController());
    Get.put(CategoryController());
  }
}
