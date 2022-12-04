import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:need_to/controller/data_controller.dart';

class UserDetail extends StatefulWidget {
  const UserDetail({super.key});

  @override
  State<UserDetail> createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  DataController dataController = Get.put(DataController());
  @override
  void initState() {
    super.initState();
    dataController.getUserUInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => dataController.isDataLoading.value
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: dataController.userList!.data!.sliderBanners!.length,
              itemBuilder: (ctx, i) {
                String image = "";
                String title = "";
                String subtitle = "";
                try {
                  image = dataController
                      .userList!.data!.sliderBanners![i].bannerImg!;
                } catch (e) {
                  image = "";
                }
                try {
                  title = dataController.userList!.data!.sliderBanners![i].id!
                      .toString();
                } catch (e) {
                  title = "";
                }
                try {
                  subtitle = dataController
                      .userList!.data!.sliderBanners![i].id!
                      .toString();
                } catch (e) {
                  image = "";
                }
                return ListTile(
                  leading: CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(image),
                  ),
                  title: Text(title),
                  subtitle: Text(subtitle),
                );
              })),
    );
  }
}
