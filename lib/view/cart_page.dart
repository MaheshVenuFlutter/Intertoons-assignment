import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:need_to/controller/cart_controller.dart';

import '../util/app_colors.dart';
import '../util/big_text.dart';
import '../util/dimensions.dart';

class CartPage extends StatefulWidget {
  CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  CartController cartController = Get.find();

  int qqty = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart List"),
      ),
      body: GetBuilder<CartController>(
        builder: (cartController) {
          return Container(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.all(10),
                    elevation: 2,
                    child: Container(
                      height: Dimensions.height150,
                      width: double.maxFinite,
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(cartController
                                        .getItemsForCart[index].img!),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(12)),
                            height: Dimensions.height150,
                            width: Dimensions.width150,
                          ),
                          SizedBox(
                            width: Dimensions.width10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: Dimensions.height10,
                              ),
                              Text(
                                cartController.getItemsForCart[index].name!,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontsize18),
                              ),
                              SizedBox(
                                height: Dimensions.height10,
                              ),
                              Text(
                                "Price: ${cartController.getItemsForCart[index].price!}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontsize22),
                              ),
                              SizedBox(
                                height: Dimensions.height10,
                              ),
                              Text(
                                "quantity: ${cartController.getItemsForCart[index].quantity!}"
                                    .toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontsize20),
                              ),
                              SizedBox(
                                height: Dimensions.height10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: Dimensions.width20,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      if (cartController.getItemsForCart[index]
                                              .quantity! >
                                          -1) {
                                        cartController.addItems(
                                            cartController
                                                .getItemsForCart[index]
                                                .product!,
                                            -1,
                                            index);
                                      } else {
                                        Get.snackbar("quantity is zero", "",
                                            backgroundColor: Colors.blue,
                                            snackPosition: SnackPosition.BOTTOM,
                                            borderRadius: 10,
                                            colorText: Colors.white,
                                            borderColor: Colors.black,
                                            borderWidth: 2,
                                            barBlur: 0);
                                      }
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.blue),
                                      child: Icon(
                                        Icons.remove,
                                        size: Dimensions.iconSize30,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: Dimensions.width10,
                                  ),
                                  Text(
                                    cartController
                                        .getItemsForCart[index].quantity!
                                        .toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: Dimensions.fontsize25),
                                  ),
                                  SizedBox(
                                    width: Dimensions.width10,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      if (cartController.getItemsForCart[index]
                                              .quantity! <
                                          20) {
                                        cartController.addItems(
                                            cartController
                                                .getItemsForCart[index]
                                                .product!,
                                            1,
                                            index);
                                      } else {
                                        Get.snackbar(
                                            "Reached maximum limit", "",
                                            backgroundColor: Colors.blue,
                                            snackPosition: SnackPosition.BOTTOM,
                                            borderRadius: 10,
                                            colorText: Colors.white,
                                            borderColor: Colors.black,
                                            borderWidth: 2,
                                            barBlur: 0);
                                      }
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.blue),
                                      child: Icon(
                                        Icons.add,
                                        size: Dimensions.iconSize30,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: Dimensions.width30,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      cartController.addItems(
                                          cartController
                                              .getItemsForCart[index].product!,
                                          -20,
                                          index);
                                      print("delete");
                                    },
                                    child: Icon(
                                      Icons.delete,
                                      size: Dimensions.iconSize30,
                                      color: Colors.redAccent,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: Dimensions.height15,
                  );
                },
                itemCount: cartController.getItemsForCart.length),
          );
        },
      ),
      //bottomNavigationBar============================================================
      bottomNavigationBar: GetBuilder<CartController>(
        builder: (cartController) {
          return Container(
              height: Dimensions.containerSize120,
              padding: EdgeInsets.only(
                top: Dimensions.height20,
                bottom: Dimensions.height20,
                left: Dimensions.width10,
                right: Dimensions.width10,
              ),
              decoration: BoxDecoration(
                color: AppColors.buttonBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radious20 * 2),
                  topRight: Radius.circular(Dimensions.radious20 * 2),
                ),
              ),
              child: cartController.getItems.length > 0
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            top: Dimensions.height20,
                            bottom: Dimensions.height20,
                            left: Dimensions.width20,
                            right: Dimensions.width20,
                          ),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radious20),
                            color: Colors.white,
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: Dimensions.width10,
                              ),
                              BigText(
                                  text:
                                      "Total Rs: ${cartController.totalAmountInCart.toStringAsFixed(2)}"),
                              SizedBox(
                                width: Dimensions.width10,
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            cartController.addTohistory();
                            cartController.qt.value = 0;
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                              top: Dimensions.height20,
                              bottom: Dimensions.height20,
                              left: Dimensions.width20,
                              right: Dimensions.width20,
                            ),
                            child: BigText(
                              text: "Check Out",
                              color: Colors.white,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                Dimensions.radious20,
                              ),
                              color: AppColors.mainColor,
                            ),
                          ),
                        ),
                      ],
                    )
                  : Container());

          //bottomNavigationBar=================================
        },
      ),
    );
  }
}
