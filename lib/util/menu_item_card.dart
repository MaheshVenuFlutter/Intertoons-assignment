import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:need_to/models/user_model.dart';

import '../controller/cart_controller.dart';
import '../controller/data_controller.dart';
import '../models/cart_product_model.dart';

class menuitemCard extends StatelessWidget {
  menuitemCard(
      {Key? key,
      required this.dataController,
      required this.index,
      required this.variationdClickHandler,
      required this.addButtonVisibility,
      required this.moreOptionsVisibility})
      : super(key: key);

  final DataController dataController;
  int index;
  final Function variationdClickHandler;
  var addButtonVisibility;
  var moreOptionsVisibility;
  var textsize;
  CartController cartController = Get.find();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        variationdClickHandler();
      },
      child: Column(
        children: [
          Container(
            height: 240,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12)),
                      image: DecorationImage(
                          image: NetworkImage(dataController.userList!.data!
                              .bestsellerProducts![index].image!),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: 90,
                    width: MediaQuery.of(context).size.width - 20,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 250, 217, 217),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                dataController.userList!.data!
                                    .bestsellerProducts![index].name!,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22),
                              ),
                              Text(
                                " ${dataController.userList!.data!.bestsellerProducts![index].price!}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Stack(
                          children: [
                            Positioned(
                              child: SizedBox(
                                width: 100,
                                height: 40,
                                child: Visibility(
                                  visible: addButtonVisibility,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      cartController.additemToCart(
                                          dataController.userList!.data!
                                              .bestsellerProducts![index]);
                                    },
                                    child: Text(
                                      "add",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              child: SizedBox(
                                width: 100,
                                height: 40,
                                child: Visibility(
                                  visible: moreOptionsVisibility,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: Text(
                                      "more options",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
