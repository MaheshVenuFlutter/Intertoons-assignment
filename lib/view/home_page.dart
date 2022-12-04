import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:get/get.dart';
import 'package:matcher/matcher.dart';
import 'package:need_to/view/user_detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              child: ElevatedButton(
                child: Text("get data"),
                onPressed: (() {
                  Get.to(() => UserDetail());
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
