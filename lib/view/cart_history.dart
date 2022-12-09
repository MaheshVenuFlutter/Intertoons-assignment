// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:need_to/controller/cart_controller.dart';
// import 'package:intl/intl.dart';

// import '../models/cart_model.dart';
// import '../util/app_colors.dart';
// import '../util/app_icon.dart';
// import '../util/big_text.dart';
// import '../util/dimensions.dart';
// import '../util/small_text.dart';
// import 'new_no_data_page.dart';

// class CartHistory extends StatelessWidget {
//   const CartHistory({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var getCartHistoryList =
//         Get.find<CartController>().getCartHistoryList().reversed.toList();
//     Map<String, int> cartItemsPerOrder = Map();

//     for (int i = 0; i < getCartHistoryList.length; i++) {
//       if (cartItemsPerOrder.containsKey(getCartHistoryList[i].time)) {
//         cartItemsPerOrder.update(
//             getCartHistoryList[i].time!, (value) => ++value);
//       } else {
//         cartItemsPerOrder.putIfAbsent(getCartHistoryList[i].time!, () => 1);
//       }
//     }
//     List<int> cartItemsPerOrderToList() {
//       return cartItemsPerOrder.entries.map((e) => e.value).toList();
//     }

//     List<String> cartOrderTimeToList() {
//       return cartItemsPerOrder.entries.map((e) => e.key).toList();
//     }

//     List<int> itemsPerorder = cartItemsPerOrderToList();

//     var listCounter = 0;

//     Widget timeWidget(int index) {
//       var outputDate = DateTime.now().toString();
//       if (index < getCartHistoryList.length) {
//         DateTime parseDate = DateFormat("yyyy-MM-dd HH:MM:SS")
//             .parse(getCartHistoryList[listCounter].time!);
//         var inputDate = DateTime.parse(parseDate.toString());
//         var outputFormat = DateFormat("MM/dd/yyyy  hh:mm a");
//         outputDate = outputFormat.format(inputDate);
//       }
//       return BigText(text: outputDate);
//     }

//     return Scaffold(
//       body: Column(
//         children: [
//           //
//           //app bar
//           //
//           Container(
//             color: AppColors.mainColor,
//             height: Dimensions.height10 * 10,
//             width: double.maxFinite,
//             padding: EdgeInsets.only(top: Dimensions.height50),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 BigText(text: "Cart History", color: Colors.white),
//                 GestureDetector(
//                   onTap: () {
//                     // Get.toNamed(RouteHelper.getInitial());
//                   },
//                   child: AppIcin(
//                     icon: Icons.home_outlined,
//                     iconColor: AppColors.mainColor,
//                     bagroundColor: Colors.amberAccent,
//                   ),
//                 )
//               ],
//             ),
//           ),
//           GetBuilder<CartController>(builder: (_cartController) {
//             return _cartController.getCartHistoryList().length > 0
//                 ? Expanded(
//                     child: Container(
//                         ////////container 1 MASTER CONTAINER///////////////// 1

//                         margin: EdgeInsets.only(
//                             top: Dimensions.height20,
//                             left: Dimensions.width20,
//                             right: Dimensions.width20),
//                         child: MediaQuery.removePadding(
//                           removeTop: true,
//                           context: context,
//                           child: ListView(
//                             children: [
//                               for (int i = 0; i < itemsPerorder.length; i++)
//                                 Container(
//                                   //container with TIME,TOTAL AMOUNT, ITEM IMAGES,/////////////////////////////////////////////////////
//                                   decoration: BoxDecoration(
//                                     color: Colors.white,
//                                     boxShadow: [
//                                       BoxShadow(
//                                           blurRadius: 1,
//                                           offset: Offset(0, 2),
//                                           color: Colors.grey.withOpacity(0.2))
//                                     ],
//                                   ),

//                                   height: Dimensions.height50 * 4 -
//                                       Dimensions.height30,
//                                   margin: EdgeInsets.only(
//                                       bottom: Dimensions.height20),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       timeWidget(listCounter),
//                                       SizedBox(
//                                         height: Dimensions.height10,
//                                       ),
//                                       BigText(
//                                         text: "Total amount = \Rs " +
//                                             _cartController.totalAmountInCart
//                                                 .toString(),
//                                         size: Dimensions.fontSize26,
//                                       ),
//                                       SizedBox(
//                                         height: Dimensions.height10,
//                                       ),
//                                       Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Wrap(
//                                             direction: Axis.horizontal,
//                                             children: List.generate(
//                                                 itemsPerorder[i], (index) {
//                                               if (listCounter <
//                                                   getCartHistoryList.length) {
//                                                 listCounter++;
//                                               }
//                                               //
//                                               //images
//                                               //
//                                               return index <= 2
//                                                   ? Container(
//                                                       height: 80,
//                                                       width: 80,
//                                                       margin: EdgeInsets.only(
//                                                           right: Dimensions
//                                                                   .width10 /
//                                                               2),
//                                                       decoration: BoxDecoration(
//                                                           borderRadius: BorderRadius
//                                                               .circular(Dimensions
//                                                                       .radious20 /
//                                                                   2),
//                                                           image: DecorationImage(
//                                                               fit: BoxFit.cover,
//                                                               image: AssetImage(
//                                                                   "dogo.png"))),
//                                                     )
//                                                   : Container();
//                                             }),
//                                           ),
//                                           Container(
//                                             height: Dimensions.height40 * 2,
//                                             child: Column(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.spaceEvenly,
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.end,
//                                               children: [
//                                                 smallText(
//                                                     text: "Total",
//                                                     color:
//                                                         AppColors.titleColor),
//                                                 BigText(
//                                                   text: cartItemsPerOrder
//                                                   color: AppColors.titleColor,
//                                                 ),
//                                                 GestureDetector(
//                                                   onTap: () {
//                                                     var ordertime =
//                                                         cartOrderTimeToList();
//                                                     Map<int, CartModel>
//                                                         moreOrder = {};
//                                                     for (int j = 0;
//                                                         j <
//                                                             getCartHistoryList
//                                                                 .length;
//                                                         j++) {
//                                                       if (getCartHistoryList[j]
//                                                               .time ==
//                                                           ordertime[i]) {
//                                                         moreOrder.putIfAbsent(
//                                                             getCartHistoryList[j]
//                                                                 .id!,
//                                                             () => CartModel.fromJson(
//                                                                 jsonDecode(jsonEncode(
//                                                                     getCartHistoryList[
//                                                                         j]))));
//                                                       }
//                                                     }
//                                                     Get.find<CartController>()
//                                                         .setItems = moreOrder;
//                                                     // Get.find<CartController>()
//                                                     //     .addToCartList();
//                                                     // Get.toNamed(RouteHelper
//                                                     //     .getCartPage());
//                                                   },
//                                                   child: Container(
//                                                     padding:
//                                                         EdgeInsets.symmetric(
//                                                             horizontal:
//                                                                 Dimensions
//                                                                     .width10,
//                                                             vertical: Dimensions
//                                                                     .height10 /
//                                                                 2),
//                                                     decoration: BoxDecoration(
//                                                         border: Border.all(
//                                                             width: 1,
//                                                             color: AppColors
//                                                                 .mainColor),
//                                                         borderRadius: BorderRadius
//                                                             .circular(Dimensions
//                                                                     .radious20 /
//                                                                 3)),
//                                                     child: smallText(
//                                                       text: "One More",
//                                                       color:
//                                                           AppColors.mainColor,
//                                                     ),
//                                                   ),
//                                                 )
//                                               ],
//                                             ),
//                                           )
//                                         ],
//                                       )
//                                     ],
//                                   ),
//                                 )
//                             ],
//                           ),
//                         )),
//                   )
//                 : Container(
//                     height: MediaQuery.of(context).size.height / 1.5,
//                     child: const Center(
//                       child: NoDataPage(
//                         text: "Cart history is empty !",
//                         imgPath: "assets/image/your cart is empty.png",
//                       ),
//                     ),
//                   );
//           })
//         ],
//       ),
//     );
//   }
// }
