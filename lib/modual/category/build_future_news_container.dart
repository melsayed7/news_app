import 'package:flutter/material.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/SourcesResponse.dart';
import 'package:news_app/modual/category/news_item.dart';
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
  bool isLoading = false;
  int page = 0;
  List<Articles> newsArticles = [];

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels == 0) {
          bool isTop = scrollController.position.pixels == 0;
          if (isTop) {
            isLoading = true;
            setState(() {});
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse>(
      future: !isLoading
          ? ApiManger.getNews(sourceID: widget.source.id ?? '')
          : ApiManger.getNews(sourceID: widget.source.id ?? '', page: ++page),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Column(
              children: [
                const Text('Some Thing Go Wrong'),
                ElevatedButton(
                    onPressed: () {
                      ApiManger.getNews(sourceID: widget.source.id ?? '');
                    },
                    child: const Text('Try Again'))
              ],
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: MyColor.primaryColor,
            ),
          );
        }
        if (snapshot.data?.status != 'ok') {
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
        }

        var newsList = snapshot.data?.articles ?? [];
        newsArticles.addAll(newsList);
        return ListView.builder(
          controller: scrollController,
          itemCount: newsList.length,
          itemBuilder: (context, index) {
            return NewsItem(articles: newsList[index]);
          },
        );
      },
    );
  }
}
