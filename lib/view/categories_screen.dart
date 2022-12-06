import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:need_to/controller/category_controller.dart';
import 'package:need_to/controller/data_controller.dart';
import 'package:need_to/view/variations_screen.dart';

import '../models/user_model.dart';
import '../util/menu_item_card.dart';

class CategoriesScreen extends StatefulWidget {
  Product? model;
  BuildContext? context;
  CategoriesScreen({super.key, this.model, this.context});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with TickerProviderStateMixin {
  String search = "94";
  var addButtonVisibility;
  var moreOptionsVisibility;

  //CategoryController dependency injection//=========================
  CategoryController categoryController = Get.put(CategoryController());
  DataController dataController = Get.put(DataController());

  @override
  void initState() {
    categoryController.getCategoryData();
    dataController.getUserUInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // tab bar comtroller//===================================

    return Scaffold(
      body: Obx(
        () => dataController.isHomePageDataLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    "Explore menu",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 5,
                    child: Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.1),
                        ),
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  print(
                                    categoryController
                                        .categoryList!.data![index].catId,
                                  );
                                  setState(() {
                                    search = categoryController
                                        .categoryList!.data![index].catId
                                        .toString();
                                  });
                                },
                                child: Container(
                                  width: 100,
                                  height: 20,
                                  child: Center(
                                    child: Text(categoryController
                                        .categoryList!.data![index].catName!),
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                width: 10,
                              );
                            },
                            itemCount:
                                categoryController.categoryList!.data!.length)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Container(
                        margin: const EdgeInsets.only(right: 10, left: 10),
                        child: ListView.separated(
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 10,
                            );
                          },
                          itemCount: dataController
                              .userList!.data!.bestsellerProducts!.length,
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            bool addButtonVisibility = false;
                            var currentProduct = dataController
                                .userList!.data!.bestsellerProducts![index];

                            late String catgeryIId = dataController.userList!
                                .data!.bestsellerProducts![index].categoryId
                                .toString();
                            if (currentProduct.variations == null) {
                              addButtonVisibility = true;
                              moreOptionsVisibility = false;
                            } else {
                              moreOptionsVisibility = true;
                            }
                            if (catgeryIId
                                .toString()
                                .contains(search.toString())) {
                              return menuitemCard(
                                moreOptionsVisibility: moreOptionsVisibility,
                                addButtonVisibility: addButtonVisibility,
                                index: index,
                                dataController: dataController,
                                variationdClickHandler: () {
                                  if (currentProduct.variations != null) {
                                    Get.to(() => VariationScreen(
                                          indexx: index,
                                        ));
                                  } else {}

                                  print(currentProduct.variations);
                                },
                              );
                            } else {
                              return Container();
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
