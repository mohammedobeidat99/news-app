import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

import '../model/news_model2.dart';

class NewsController extends GetxController {
  RxList<Article> articles = <Article>[].obs;
  var isLoading = true.obs;

  
  

  Future<void> fetchData(
       //String category
      ) async {
    isLoading.value = true;

    final url = Uri.parse(
      'https://gnews.io/api/v4/top-headlines?apikey=c7fe32e58235bade6f251558389282ec&lang=ar&category=sport');
       // 'https://gnews.io/api/v4/top-headlines?category="$category"&lang=ar&apikey=bcbf4bbc345e87c66ea22dca8281efbd');
    //'https://gnews.io/api/v4/top-headlines?category=${category}&lang=ar&apikey=bcbf4bbc345e87c66ea22dca8281efbd');
    // "https://newsapi.org/v2/top-headlines?country=eg&category=${category}&apiKey=85124ef4b67945d2af0e6751294c2e1f");

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final articlesData = Articles.fromJson(jsonDecode(response.body));
        isLoading.value = false;

        articles.assignAll(articlesData.articles as Iterable<Article>);
      } else {
        // Get.showSnackbar(
        //   const GetSnackBar(
        //     message: 'Please try again later.',
        //     icon: Icon(
        //       Icons.error,
        //       color: Colors.white,
        //     ),
        //     backgroundColor: Colors.red,
        //     duration: Duration(seconds: 4),
        //   ),
        // );
      }
    } catch (e) {
     // Get.snackbar("Error", e.toString());
    }
  }
  @override
  void onInit() {
    fetchData();
    super.onInit();
  }
 
}
