import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:need_to/controller/cart_controller.dart';

import 'package:need_to/controller/data_controller.dart';

import 'package:need_to/util/app_colors.dart';
import 'package:need_to/util/dimensions.dart';
import 'package:need_to/view/categories_screen.dart';
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
        title: const Text("new app bar"),
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
                          margin: EdgeInsets.only(top: Dimensions.height10),
                          height: Dimensions.height150,
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
                                height: Dimensions.height400),
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.height10,
                        ),
                        buildIndicator(),
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          right: Dimensions.width10, left: Dimensions.width10),
                      height: Dimensions.height240,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "featured products",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: Dimensions.fontsize22),
                          ),
                          SizedBox(
                            height: Dimensions.height10,
                          ),
                          Container(
                            // featured product list view container //starts here
                            height: Dimensions.height175,

                            width: MediaQuery.of(context).size.width -
                                Dimensions.width15,
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  late String featuredProductCategories =
                                      dataController.userList!.data!
                                          .bestsellerProducts![index].categoryId
                                          .toString();
                                  return GestureDetector(
                                    onTap: () {
                                      Get.to(CategoriesScreen(),
                                          transition: Transition.rightToLeft,
                                          duration: Duration(seconds: 1),
                                          arguments: dataController
                                              .userList!
                                              .data!
                                              .featuredProducts![index]
                                              .categoryId);
                                    },
                                    child: Card(
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
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  10),
                                                          topRight:
                                                              Radius.circular(
                                                                  10))),
                                              height: Dimensions.height120,
                                              width: Dimensions.width200,
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 0,
                                            child: Container(
                                              height: Dimensions.height50,
                                              width: Dimensions.width200,
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
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  10))),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(
                                                        width:
                                                            Dimensions.width10,
                                                      ),
                                                      Text(
                                                        dataController
                                                            .userList!
                                                            .data!
                                                            .featuredProducts![
                                                                index]
                                                            .name!,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            fontSize: Dimensions
                                                                .fontsize16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
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
                                                      SizedBox(
                                                        width:
                                                            Dimensions.width10,
                                                      ),
                                                      Text(
                                                        "Price Rs: ${dataController.userList!.data!.featuredProducts![index].price!}",
                                                        style: TextStyle(
                                                            color: Colors
                                                                .redAccent,
                                                            fontSize: Dimensions
                                                                .fontsize18),
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
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                    width: Dimensions.width10,
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
                      height: Dimensions.height150,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.separated(
                        itemCount: dataController
                            .userList!.data!.additionalBanners!.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(
                                right: Dimensions.width10,
                                left: Dimensions.width10),
                            height: Dimensions.height120,
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
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    Container(
                      height: Dimensions.height600,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(
                          right: Dimensions.width10, left: Dimensions.width10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Best Sellers",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: Dimensions.fontsize22),
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
        margin: EdgeInsets.only(top: Dimensions.height10),
        height: Dimensions.height500,
        width: MediaQuery.of(context).size.width,
        child: ListView.separated(
            itemBuilder: (context, index) {
              bool addButtonVisibility = false;
              var currentProduct =
                  dataController.userList!.data!.bestsellerProducts![index];

              late String BestSellerProductcatgeryIId = dataController
                  .userList!.data!.bestsellerProducts![index].categoryId
                  .toString();
              if (currentProduct.variations == null) {
                addButtonVisibility = true;
                moreOptionsVisibility = false;
              } else {
                moreOptionsVisibility = true;
              }
              return Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                  height: Dimensions.height150,
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
                        height: Dimensions.height150,
                        width: Dimensions.width150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage(dataController.userList!
                                    .data!.bestsellerProducts![index].image!),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(
                        width: Dimensions.width10,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: Dimensions.height10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            //name of the product=================================================name of the product
                            Text(
                              overflow: TextOverflow.ellipsis,
                              dataController.userList!.data!
                                  .bestsellerProducts![index].name!,
                              style: TextStyle(
                                  fontFamily: "Acme",
                                  fontWeight: FontWeight.bold,
                                  fontSize: Dimensions.fontsize20),
                            ),
                            SizedBox(
                              height: Dimensions.height10,
                            ),
                            //price of the product==================
                            Row(
                              children: [
                                Text(
                                  overflow: TextOverflow.ellipsis,
                                  "Price: ${dataController.userList!.data!.bestsellerProducts![index].price!}",
                                  style: TextStyle(
                                      fontFamily: "Acme",
                                      fontWeight: FontWeight.bold,
                                      fontSize: Dimensions.fontsize20),
                                ),
                                const SizedBox(
                                  width: 21,
                                ),
                                Container(
                                  width: Dimensions.width80,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        child: SizedBox(
                                          width: Dimensions.width50,
                                          height: Dimensions.height30,
                                          child: Visibility(
                                            visible: addButtonVisibility,
                                            child: ElevatedButton(
                                              // add to cat button/=======================
                                              onPressed: () {
                                                print(index);
                                                cartController.additemToCart(
                                                    currentProduct, index);
                                              },
                                              child: Text(
                                                "+",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:
                                                        Dimensions.fontsize25),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        child: Center(
                                          child: Visibility(
                                            visible: moreOptionsVisibility,
                                            child: Container(
                                              width: Dimensions.width50,
                                              decoration: BoxDecoration(
                                                  color: Colors.redAccent,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Center(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    ///sending adata to netx page===============================
                                                    Get.to(CategoriesScreen(),
                                                        transition: Transition
                                                            .rightToLeft,
                                                        duration: Duration(
                                                            seconds: 1),
                                                        arguments: dataController
                                                            .userList!
                                                            .data!
                                                            .featuredProducts![
                                                                index]
                                                            .categoryId);
                                                  },
                                                  child: Text(
                                                    "more",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: Dimensions
                                                            .fontsize20),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: Dimensions.height10,
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
              return SizedBox(
                height: Dimensions.height15,
              );
            },
            itemCount:
                dataController.userList!.data!.bestsellerProducts!.length),
      );
    });
  }
}
