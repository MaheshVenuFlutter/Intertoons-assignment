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
                      height: 150,
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
                            height: 150,
                            width: 150,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                cartController.getItemsForCart[index].name!,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Price: ${cartController.getItemsForCart[index].price!}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "quantity: ${cartController.getItemsForCart[index].quantity!}"
                                    .toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    width: 20,
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
                                            -1);
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
                                      child: const Icon(
                                        Icons.remove,
                                        size: 30,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    cartController
                                        .getItemsForCart[index].quantity!
                                        .toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  ),
                                  const SizedBox(
                                    width: 10,
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
                                            1);
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
                                      child: const Icon(
                                        Icons.add,
                                        size: 30,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      cartController.addItems(
                                          cartController
                                              .getItemsForCart[index].product!,
                                          -20);
                                      print("delete");
                                    },
                                    child: const Icon(
                                      Icons.delete,
                                      size: 35,
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
                  return const SizedBox(
                    height: 15,
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
