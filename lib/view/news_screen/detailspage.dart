import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/constant/colors.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../model/news_model.dart';
import '../../model/news_model2.dart';

class ArticleDetails extends StatelessWidget {
  final Article? article;

  ArticleDetails({this.article});

  // Future<void> _launchURL() async {
  //   final String url = article!.url.toString();
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw Exception('Could not launch $url');
  //   }
  // }

  Future<void> _launchUrl() async {
    final String url = article!.url.toString();

    if (!await launchUrl(url as Uri)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article!.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          elevation: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
                child: Image.network(
                  article!.image.toString(),
                  fit: BoxFit.fill,
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return Icon(Icons.image_not_supported);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Published At: ${article?.publishedAt.year}-${article?.publishedAt.month.toString().padLeft(2, '0')}-${article?.publishedAt.day.toString().padLeft(2, '0')} ${article?.publishedAt.hour.toString().padLeft(2, '0')}:${article?.publishedAt.minute.toString().padLeft(2, '0')}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      article!.content.toString(),
                      style: TextStyle(fontSize: 16),
                      textDirection: TextDirection.rtl,
                    ),
                    SizedBox(height: 16),
                    TextButton(
                      onPressed: _launchUrl,
                      child: Text(
                        'Read More',
                        style: TextStyle(
                          fontSize: 16,
                          color: color.maincolor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
