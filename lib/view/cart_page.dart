import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:need_to/controller/cart_controller.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});
  CartController cartController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart List"),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            var currentItem = cartController.CartItemList[index];
            return Card(
              clipBehavior: Clip.none,
              child: Row(
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                            image: NetworkImage(currentItem.image!),
                            fit: BoxFit.cover)),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      Text(
                        currentItem.id.toString(),
                        style: TextStyle(fontSize: 25),
                      )
                    ],
                  )
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 15,
            );
          },
          itemCount: cartController.CartItemList.length),
    );
  }
}
