import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:need_to/controller/cart_controller.dart';

import 'package:need_to/controller/data_controller.dart';
import 'package:need_to/models/cart_product_model.dart';
import 'package:need_to/models/user_model.dart';
import 'package:need_to/util/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../util/icon_and_text_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DataController dataController = Get.find();
  CartController cartController = Get.find();

  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("new app bar"),
      ),
      body: Obx(
        () => dataController.isHomePageDataLoading.value
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// slider 1
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          height: 150,
                          width: MediaQuery.of(context).size.width,
                          child: CarouselSlider.builder(
                            itemCount: dataController
                                .userList!.data!.sliderBanners!.length,
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
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 10, left: 10),
                      height: 240,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "featured products",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            // featured product list view container //starts here
                            height: 175,

                            width: MediaQuery.of(context).size.width - 15,
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    elevation: 5,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        dataController
                                                            .userList!
                                                            .data!
                                                            .featuredProducts![
                                                                index]
                                                            .image!),
                                                    fit: BoxFit.cover),
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10),
                                                    topRight:
                                                        Radius.circular(10))),
                                            height: 120,
                                            width: 200,
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 0,
                                          child: Container(
                                            height: 50,
                                            width: 200,
                                            decoration: const BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Color(0xFFe8e8e8),
                                                    offset: Offset(0, 5),
                                                  ),
                                                  BoxShadow(
                                                    color: Colors.white,
                                                    offset: Offset(0, 0),
                                                  ),
                                                  BoxShadow(
                                                    color: Colors.white,
                                                    offset: Offset(0, 0),
                                                  ),
                                                ],
                                                //featured product details container///----------
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(10),
                                                    bottomRight:
                                                        Radius.circular(10))),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      dataController
                                                          .userList!
                                                          .data!
                                                          .featuredProducts![
                                                              index]
                                                          .name!,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: const TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Row(
                                                  children: [
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      "Price Rs: ${dataController.userList!.data!.featuredProducts![index].price!}",
                                                      style: const TextStyle(
                                                          color:
                                                              Colors.redAccent,
                                                          fontSize: 18),
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                    width: 10,
                                  );
                                },
                                itemCount: dataController
                                    .userList!.data!.featuredProducts!.length),
                          ),
                        ],
                      ),
                    ),
                    // additional banner//--------------------------
                    Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.separated(
                        itemCount: dataController
                            .userList!.data!.additionalBanners!.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(right: 10, left: 10),
                            height: 120,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(dataController
                                      .userList!
                                      .data!
                                      .additionalBanners![index]
                                      .bannerImg!),
                                  fit: BoxFit.cover),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 5,
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 600,
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(right: 10, left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Best Sellers",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                          ),
                          BestSellerHomepageView(
                              dataController: dataController,
                              cartController: cartController)
                        ],
                      ),
                    )
                  ],
                ),
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

///Best seller view======
class BestSellerHomepageView extends StatelessWidget {
  var addButtonVisibility;
  var moreOptionsVisibility;
  BestSellerHomepageView({
    Key? key,
    required this.dataController,
    required this.cartController,
  }) : super(key: key);

  final DataController dataController;
  final CartController cartController;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DataController>(builder: (daTaController) {
      return Container(
        margin: const EdgeInsets.only(top: 10),
        height: 500,
        width: MediaQuery.of(context).size.width,
        child: ListView.separated(
            itemBuilder: (context, index) {
              var currentProduct =
                  dataController.userList!.data!.bestsellerProducts![index];
              if (currentProduct.variations == null) {
                addButtonVisibility = true;
                moreOptionsVisibility = false;
              } else {
                moreOptionsVisibility = false;
              }
              return Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xFFe8e8e8),
                        offset: Offset(0, 5),
                      ),
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(-5, 0),
                      ),
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(5, 0),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.iconColor1,
                  ),
                  child: Row(
                    /// Best seller image row--------------------------------------------
                    children: [
                      Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage(dataController.userList!
                                    .data!.bestsellerProducts![index].image!),
                                fit: BoxFit.cover)),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            //name of the product=================================================name of the product
                            Text(
                              overflow: TextOverflow.ellipsis,
                              dataController.userList!.data!
                                  .bestsellerProducts![index].name!,
                              style: const TextStyle(
                                  fontFamily: "Acme",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            //price of the product==================
                            Row(
                              children: [
                                Text(
                                  overflow: TextOverflow.ellipsis,
                                  "Price: ${dataController.userList!.data!.bestsellerProducts![index].price!}",
                                  style: const TextStyle(
                                      fontFamily: "Acme",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Stack(
                                  children: [
                                    Positioned(
                                      child: SizedBox(
                                        width: 50,
                                        height: 30,
                                        child: Visibility(
                                          visible: addButtonVisibility,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              cartController.additemToCart(
                                                  currentProduct, index);
                                            },
                                            child: const Text(
                                              "+",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 25),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      child: Visibility(
                                        visible: moreOptionsVisibility,
                                        child: const Text(
                                          "more options",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),

                            /// veg non veg details
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconAndTextWidget(
                                    icon: Icons.circle_sharp,
                                    text: "veg",
                                    iconColor: Colors.cyan),
                                const SizedBox(
                                  width: 5,
                                ),
                                //
                                //secopnd icon
                                IconAndTextWidget(
                                    icon: Icons.location_on,
                                    text: '1.7',
                                    iconColor: Colors.red),
                                const SizedBox(
                                  width: 5,
                                ),
                                //
                                //third icon
                                IconAndTextWidget(
                                    icon: Icons.access_time_outlined,
                                    text: '32min',
                                    iconColor: Colors.green)
                              ],
                            )
                          ],
                        ),
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
            itemCount:
                dataController.userList!.data!.bestsellerProducts!.length),
      );
    });
  }
}
