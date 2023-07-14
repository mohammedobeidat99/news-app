// import 'dart:convert';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_rx/src/rx_types/rx_types.dart';
// import 'package:http/http.dart' as http;

// import '../model/news_model.dart';

// class NewsController extends GetxController {
//   RxList<Article> articles = <Article>[].obs;
//   var isLoading = true.obs;

//   Future<void> fetchData(String category) async {
//     isLoading.value = true;

//     final url = Uri.parse(
//         "https://newsapi.org/v2/top-headlines?country=eg&category=${category}&apiKey=85124ef4b67945d2af0e6751294c2e1f");

//     try {
//       final response = await http.get(url);
//       if (response.statusCode == 200) {
//         final articlesData = Articles.fromJson(jsonDecode(response.body));
//         isLoading.value = false;

//         articles.assignAll(articlesData.articles as Iterable<Article>);
//       } else {
//         Get.showSnackbar(
//           const GetSnackBar(
            
//             message: 'Please try again later.',
//             icon: Icon(
//               Icons.error,
//               color: Colors.white,
//             ),
//             backgroundColor: Colors.red,
//             duration: Duration(seconds: 4),
//           ),
//         );

//         Get.snackbar(    'Theres a mistake', 'Please try again later',
//         backgroundColor: Colors.red ,icon: Icon(Icons.error,color:Colors.white)

//         );
    
            
//       }
//     } catch (e) {
//       Get.snackbar("Error", e.toString());
//     }
//   }
// }
