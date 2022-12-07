import 'package:get/get.dart';
import 'package:need_to/controller/cart_controller.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    //CategoryController dependency injection//=========================

    Get.put(CartController());
  }
}
