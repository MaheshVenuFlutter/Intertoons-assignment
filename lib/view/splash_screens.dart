import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:need_to/repository/cartRepo.dart';
import 'package:need_to/view/host_Screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controller/category_controller.dart';
import '../controller/data_controller.dart';
import '../util/dimensions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  DataController dataController = Get.find();
  CategoryController categoryController = Get.find();
  late Animation<double> animation;
  late AnimationController controller;

  Future<void> _loadResource() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    dataController.getUserUInfo();
    categoryController.getCategoryData();
  }

  @override
  void initState() {
    super.initState();
    _loadResource();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3))
          ..forward();

    animation = CurvedAnimation(parent: controller, curve: Curves.linear);

    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (c) => const HostScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: animation,
            child: Center(
              child: Image.asset(
                "assets/image/M.v.png",
                width: Dimensions.splashImg,
              ),
            ),
          ),
          Center(
            child: Image.asset(
              "assets/image/it's.png",
              width: Dimensions.splashImg,
            ),
          )
        ],
      ),
    );
  }
}
