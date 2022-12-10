import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:need_to/controller/category_controller.dart';
import 'package:need_to/util/app_colors.dart';
import 'package:need_to/view/cart_history.dart';
import 'package:need_to/view/categories_screen.dart';
import 'package:need_to/view/home_screen.dart';

import '../controller/data_controller.dart';

class HostScreen extends StatefulWidget {
  const HostScreen({super.key});

  @override
  State<HostScreen> createState() => _HostScreenState();
}

class _HostScreenState extends State<HostScreen> {
  DataController dataController = Get.find();
  CategoryController categoryController = Get.find();

  int _selectedIndex = 0;
  List pages = [
    HomePage(),
    CategoriesScreen(),
    CartHistoryScreen(),
    Container(child: Text("page two")),
  ];

  void ontapNav(int index) {
    print(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[_selectedIndex],
        bottomNavigationBar: Container(
          height: 70,
          color: AppColors.mainColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: GNav(
                backgroundColor: AppColors.mainColor,
                gap: 8,
                color: Colors.blue,
                activeColor: Colors.blue,
                tabBackgroundColor: const Color.fromARGB(255, 99, 181, 248),
                padding: const EdgeInsets.all(16),
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                tabs: const [
                  GButton(
                    icon: Icons.home_outlined,
                    text: "Home",
                  ),
                  GButton(
                    icon: Icons.menu_outlined,
                    text: "menu",
                  ),
                  GButton(
                    icon: Icons.shopping_cart,
                    text: "cart",
                  ),
                  GButton(
                    icon: Icons.favorite,
                    text: "fav",
                  ),
                ]),
          ),
        ));
  }
}
