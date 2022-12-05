import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:need_to/controller/category_controller.dart';
import 'package:need_to/controller/data_controller.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with TickerProviderStateMixin {
  String search = " ";

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
                    "Category",
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
                                  print(categoryController
                                      .categoryList!.data![index].catId);
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
                        late String catgeryIId = dataController.userList!.data!
                            .bestsellerProducts![index].categoryId
                            .toString();
                        if (catgeryIId.toString().contains(search.toString())) {
                          return Text(dataController.userList!.data!
                              .bestsellerProducts![index].name!);
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ))
                ],
              ),
      ),
    );
  }
}
