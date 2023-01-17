import 'package:flutter/material.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/SourcesResponse.dart';
import 'package:news_app/module/category/news_item.dart';
import 'package:news_app/shared/network/remote/api_manger.dart';
import 'package:news_app/shared/style/my_color.dart';

class BuildFutureNewsContainer extends StatefulWidget {
  Source source;

  BuildFutureNewsContainer({required this.source});

  @override
  State<BuildFutureNewsContainer> createState() =>
      _BuildFutureNewsContainerState();
}

class _BuildFutureNewsContainerState extends State<BuildFutureNewsContainer> {
  ScrollController scrollController = ScrollController();
  bool loadingNextPage = false;
  int page = 1;
  List<Articles> newsArticles = [];

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;
        if (!isTop) {
          loadingNextPage = true;
          setState(() {});
        }
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (loadingNextPage == true) {
      ApiManger.getNews(sourceID: widget.source.id ?? '', page: ++page)
          .then((newsResponse) {
        var newsList = newsResponse.articles;
        newsArticles.addAll(newsList ?? []);
        loadingNextPage = false;
        setState(() {});
      });
    }

    return FutureBuilder<NewsResponse>(
      future: ApiManger.getNews(sourceID: widget.source.id ?? ''),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Column(
              children: [
                Text(snapshot.error.toString()),
                ElevatedButton(
                    onPressed: () {
                      ApiManger.getNews(sourceID: widget.source.id ?? '');
                    },
                    child: const Text('Try Again'))
              ],
            ),
          );
        } else if (snapshot.data?.status == 'error') {
          return Center(
            child: Column(
              children: [
                Text(snapshot.data?.message ?? ''),
                ElevatedButton(
                    onPressed: () {
                      ApiManger.getNews(sourceID: widget.source.id ?? '');
                    },
                    child: const Text('Try Again'))
              ],
            ),
          );
        } else if (snapshot.hasData) {
          if (newsArticles.isEmpty) {
            newsArticles = snapshot.data?.articles ?? [];
          } else if (newsArticles[0].title !=
              snapshot.data?.articles?[0].title) {
            scrollController.jumpTo(0);
            newsArticles = snapshot.data?.articles ?? [];
          }

          return ListView.builder(
            controller: scrollController,
            itemCount: newsArticles.length,
            itemBuilder: (context, index) {
              return NewsItem(articles: newsArticles[index]);
            },
          );
        }
        return Center(
          child: CircularProgressIndicator(
            color: MyColor.primaryColor,
          ),
        );
      },
    );
  }
}
