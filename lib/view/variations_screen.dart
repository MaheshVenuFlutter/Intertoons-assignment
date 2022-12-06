import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:need_to/models/user_model.dart';

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
            : ListView.separated(
                itemBuilder: (context, index) {
                  String name = "";
                  return Text(dataController
                      .userList!
                      .data!
                      .bestsellerProducts![widget.indexx]
                      .variations![index]
                      .title!);
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 20,
                  );
                },
                itemCount: dataController.userList!.data!
                    .bestsellerProducts![widget.indexx].variations!.length),
      ),
    );
  }
}
