import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/category_model.dart';

class CategoryController extends GetxController {
  Category? categoryList;
  var isCategoryDataLoading = false.obs;

  getCategoryData() async {
    try {
      isCategoryDataLoading(true);
      http.Response response = await http.get(
          Uri.tryParse('http://fda.intertoons.com/api/V1/categories')!,
          headers: {'Authorization': 'Bearer akhil@intertoons.com'});
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        categoryList = Category.fromJson(result);
      } else {
        print("getCategoryData api call failed");
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isCategoryDataLoading(false);
    }
  }
}
