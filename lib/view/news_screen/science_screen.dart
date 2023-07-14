import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/controller/news_controller_health%20copy.dart';
import 'package:news/controller/news_controller_sport.dart';

import '../../controller/news_controller_science.dart';
import '../../widget/appbar.dart';
import 'detailspage.dart';

class Science extends StatelessWidget {
  final NewsControllerScience controller = Get.put(NewsControllerScience());

  Science({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Sports'.tr,
      ),
      body: Obx(
        () {
          final news = controller.articles;

          if (news.isEmpty) {
            return Center(
              child: CircularProgressIndicator(
                color: Color.fromARGB(255, 78, 115, 207),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: news.length,
              itemBuilder: (context, int index) {
                final article = news[index];

                return GestureDetector(
                  onTap: () {
                    Get.to(ArticleDetails(article: article));
                  },
                  child: Card(
                    elevation: 10,
                    shadowColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                          child: Image.network(
                            article.image.toString(),
                            fit: BoxFit.cover,
                            errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                              return Icon(Icons.image_not_supported);
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            article.title.toString(),
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                          child: Text(
                            '${article.publishedAt.year}-${article.publishedAt.month.toString().padLeft(2, '0')}-${article.publishedAt.day.toString().padLeft(2, '0')} ${article.publishedAt.hour.toString().padLeft(2, '0')}:${article.publishedAt.minute.toString().padLeft(2, '0')}',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
