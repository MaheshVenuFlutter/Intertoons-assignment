import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/data_controller.dart';

class VariationScreen extends StatefulWidget {
  VariationScreen({super.key, required this.indexx});

  int indexx;

  @override
  State<VariationScreen> createState() => _VariationScreenState();
}

class _VariationScreenState extends State<VariationScreen> {
  //CategoryController dependency injection//=========================
  DataController dataController = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => dataController.isHomePageDataLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    dataController.userList!.data!
                        .bestsellerProducts![widget.indexx].categoryName!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(right: 10, left: 10),
                      width: MediaQuery.of(context).size.width,
                      child: ListView.separated(
                          itemBuilder: (contex, index) {
                            return Column(
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
                                                image: NetworkImage(
                                                    dataController
                                                        .userList!
                                                        .data!
                                                        .bestsellerProducts![
                                                            widget.indexx]
                                                        .image!),
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        child: Container(
                                          height: 90,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              20,
                                          decoration: const BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 250, 217, 217),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(12),
                                              bottomRight: Radius.circular(12),
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Column(
                                                children: [
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    dataController
                                                        .userList!
                                                        .data!
                                                        .bestsellerProducts![
                                                            widget.indexx]
                                                        .variations![index]
                                                        .title!,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 25),
                                                  ),
                                                  Text(
                                                    "Price:Rs ${dataController.userList!.data!.bestsellerProducts![widget.indexx].variations![index].price!}",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              SizedBox(
                                                width: 100,
                                                height: 40,
                                                child: ElevatedButton(
                                                  onPressed: () {},
                                                  child: Text(
                                                    "add",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 25),
                                                  ),
                                                ),
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
                            );
                          },
                          separatorBuilder: (contex, index) {
                            return const SizedBox(
                              height: 10,
                            );
                          },
                          itemCount: dataController
                              .userList!
                              .data!
                              .bestsellerProducts![widget.indexx]
                              .variations!
                              .length),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
