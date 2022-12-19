import 'package:flutter/material.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/modual/category/news_item_details.dart';

class NewsItem extends StatelessWidget {
  Articles articles;

  NewsItem({required this.articles});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(NewsItemDetails.routeName, arguments: articles);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              height: 230,
              width: 360,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.network(
                articles.urlToImage ?? '',
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              articles.author ?? '',
              style: const TextStyle(
                color: Color(0xff79828B),
                fontSize: 10,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              articles.title ?? '',
              style: const TextStyle(
                color: Color(0xff42505C),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              articles.publishedAt?.substring(0, 10) ?? '',
              textAlign: TextAlign.end,
              style: const TextStyle(
                color: Color(0xffA3A3A3),
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
