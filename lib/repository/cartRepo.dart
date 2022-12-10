import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/cart_model.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;
  CartRepo({required this.sharedPreferences});

  List<String> cart = [];
  List<String> cartHistory = [];
  void addToCartList(List<CartModel> cartList) {
    var timeNow = DateTime.now().toString();
    cart = [];

    cartList.forEach((element) {
      element.time = timeNow;
      return cart.add(jsonEncode(element));
    });
    sharedPreferences.setStringList("Cart-List", cart);
  }

  List<CartModel> getCartList() {
    List<String>? carts = [];
    if (sharedPreferences.containsKey("Cart-List")) {
      carts = sharedPreferences.getStringList("Cart-List");
      // print("insidecart list" + carts.toString());
    }
    List<CartModel> cartList = [];

    carts?.forEach(
        (element) => cartList.add(CartModel.fromJson(jsonDecode(element))));
    return cartList;
  }

  List<CartModel> getCartHistoryList() {
    if (sharedPreferences.containsKey("cart-history-List")) {
      cartHistory = [];
      cartHistory = sharedPreferences.getStringList("cart-history-List")!;
    }
    List<CartModel> cartListhistory = [];
    cartHistory.forEach((element) =>
        cartListhistory.add(CartModel.fromJson(jsonDecode(element))));
    return cartListhistory;
  }

  void addToCartHistoryList() {
    if (sharedPreferences.containsKey("cart-history-List")) {
      cartHistory = sharedPreferences.getStringList("cart-history-List")!;
    }
    for (var i = 0; i < cart.length; i++) {
      // print("histor List" + cart[i]);
      cartHistory.add(cart[i]);
    }
    removeCart();
    sharedPreferences.setStringList("cart-history-List", cartHistory);
    // print(" the length of history list is " +
    //     getCartHistoryList().length.toString());

    for (var j = 0; j < getCartHistoryList().length; j++) {}
  }

  void removeCart() {
    cart = [];
    sharedPreferences.remove("Cart-List");
    for (var j = 0; j < getCartHistoryList().length; j++) {
      print("the time of order is " +
          getCartHistoryList()[j].time.toString()); //to get time of each item

    }
  }
}
