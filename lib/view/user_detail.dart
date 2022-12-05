import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:need_to/controller/data_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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

  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("new app bar"),
      ),
      body: Obx(
        () => dataController.isDataLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    child: CarouselSlider.builder(
                      itemCount:
                          dataController.userList!.data!.sliderBanners!.length,
                      itemBuilder: (context, index, realIndex) {
                        return buildImage(index);
                      },
                      options: CarouselOptions(
                          enlargeCenterPage: true,

                          ///
                          //autoPlayInterval: const Duration(seconds: -4),
                          onPageChanged: (index, reson) {
                            setState(() => activeIndex = index);
                          },
                          //autoPlay: true,
                          height: 400),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  buildIndicator(),
                ],
              ),
      ),
    );
  }

  Widget buildImage(int index) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 0),
        color: Colors.grey,
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(dataController
                      .userList!.data!.sliderBanners![index].bannerImg!),
                  fit: BoxFit.cover)),
        ),
      );

  Widget buildIndicator() => AnimatedSmoothIndicator(
      effect: const ExpandingDotsEffect(
          dotHeight: 8, dotWidth: 8, radius: 20, spacing: 12),
      activeIndex: activeIndex,
      count: dataController.userList!.data!.sliderBanners!.length);
}
