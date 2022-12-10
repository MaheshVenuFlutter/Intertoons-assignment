import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/user_model.dart';

class DataController extends GetxController {
  Product? userList;
  var isHomePageDataLoading = false.obs;
  getUserUInfo() async {
    try {
      isHomePageDataLoading(true);
      http.Response response = await http.get(
          Uri.tryParse('http://fda.intertoons.com/api/V1/home')!,
          headers: {'Authorization': 'Bearer akhil@intertoons.com'});

      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        userList = Product.fromJson(result);
      } else {
        print("API call failed");
      }
    } catch (e) {
      print("Error while getting api");
    } finally {
      isHomePageDataLoading(false);
    }
    update();
  }
}
