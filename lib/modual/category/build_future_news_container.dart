import 'package:flutter/material.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/SourcesResponse.dart';
import 'package:news_app/modual/category/news_item.dart';
import 'package:news_app/shared/network/remote/api_manger.dart';
import 'package:news_app/shared/style/my_color.dart';

class BuildFutureNewsContainer extends StatelessWidget {
  Source source;

  BuildFutureNewsContainer({required this.source});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse>(
      future: ApiManger.getNews(source.id ?? ''),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: CircularProgressIndicator(
            color: MyColor.primaryColor,
          ));
        } else if (snapshot.hasError) {
          return Center(
            child: Column(
              children: [
                const Text('Some Thing Go Wrong'),
                ElevatedButton(
                    onPressed: () {
                      ApiManger.getNews(source.id ?? '');
                    },
                    child: const Text('Try Again'))
              ],
            ),
          );
        }
        if (snapshot.data?.status != 'ok') {
          return Center(
            child: Column(
              children: [
                Text(snapshot.data?.message ?? ''),
                ElevatedButton(onPressed: () {}, child: const Text('Try Again'))
              ],
            ),
          );
        }
        var newsList = snapshot.data?.articles ?? [];
        return ListView.builder(
          itemCount: newsList.length,
          itemBuilder: (context, index) {
            return NewsItem(articles: newsList[index]);
          },
        );
      },
    );
  }
}
