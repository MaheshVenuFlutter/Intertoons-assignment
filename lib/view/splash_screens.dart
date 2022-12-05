import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:need_to/view/user_detail.dart';

import 'categories_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("njan vindum vanu"),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  ElevatedButton(
                    child: Text("get data"),
                    onPressed: (() {
                      Get.to(() => UserDetail());
                    }),
                  ),
                  ElevatedButton(
                    child: Text("get data"),
                    onPressed: (() {
                      Get.to(() => CategoriesScreen());
                    }),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
