import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/modual/category/news_item.dart';
import 'package:news_app/shared/network/remote/api_manger.dart';
import 'package:news_app/shared/style/my_color.dart';

class NewsSearch extends SearchDelegate {
  late Future<NewsResponse> futureOfNewsResponse;

  NewsSearch() {
    futureOfNewsResponse = ApiManger.getNews(text: query);
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            showResults(context);
          },
          icon: Icon(
            Icons.search,
            color: MyColor.primaryColor,
          ))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.clear,
          color: MyColor.primaryColor,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/images/image.png'),
        fit: BoxFit.fill,
      )),
      child: FutureBuilder<NewsResponse>(
        future: ApiManger.getNews(text: query),
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
                        ApiManger.getNews(text: query);
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
                  ElevatedButton(
                      onPressed: () {}, child: const Text('Try Again'))
                ],
              ),
            );
          }
          var searchList = snapshot.data?.articles ?? [];
          return ListView.builder(
            itemCount: searchList.length,
            itemBuilder: (context, index) {
              return NewsItem(articles: searchList[index]);
            },
          );
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/images/image.png'),
        fit: BoxFit.fill,
      )),
      child: Center(
          child: Text(
        AppLocalizations.of(context)!.suggestion,
        style: TextStyle(fontSize: 24, color: MyColor.primaryColor),
      )),
    );
  }
}
