import 'package:flutter/material.dart';
import 'package:news_app/api/api_manger.dart';
import 'package:news_app/model/SourcesResponse.dart';
import 'package:news_app/modual/category/tabs_news_screen.dart';
import 'package:news_app/shared/style/my_color.dart';

class BuildFutureTabContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourcesResponse>(
      future: ApiManger.getSources(),
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
                      ApiManger.getSources();
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
        var sourceList = snapshot.data?.sources ?? [];
        return TabsNewsScreen(sourceList: sourceList);
      },
    );
  }
}
