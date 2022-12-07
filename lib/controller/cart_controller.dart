import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/user_model.dart';

class CartController extends GetxController {
  var numberOfItemsInCart = 0.obs;
  var totalQty = 0.obs;

  var CartItemList = <BestsellerProduct>[].obs;
  void removeItem() {
    if (numberOfItemsInCart.value > 1) {
      numberOfItemsInCart.value--;
    }
  }

  void addItem() {
    numberOfItemsInCart.value++;
  }

  void addToCartList(BestsellerProduct product) {
    if (!CartItemList.contains(product)) {
      CartItemList.add(product);
      numberOfItemsInCart++;
    } else {
      Get.snackbar("Cart!", "product already in cart",
          backgroundColor: Colors.blue,
          snackPosition: SnackPosition.BOTTOM,
          borderRadius: 10,
          colorText: Colors.white,
          borderColor: Colors.black,
          borderWidth: 2,
          barBlur: 0);
    }
  }
}
