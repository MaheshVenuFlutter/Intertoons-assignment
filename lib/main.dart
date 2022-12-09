import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:need_to/controller/cart_controller.dart';
import 'package:need_to/controller/controller_binding.dart';
import 'helper/dependencies.dart' as dep;

import 'package:need_to/view/splash_screens.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCartData();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
