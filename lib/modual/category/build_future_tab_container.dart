import 'package:flutter/material.dart';
import 'package:news_app/model/SourcesResponse.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/modual/category/tabs_news_screen.dart';
import 'package:news_app/shared/network/remote/api_manger.dart';
import 'package:news_app/shared/style/my_color.dart';

class BuildFutureTabContainer extends StatelessWidget {
  CategoryModel categoryModel;

  BuildFutureTabContainer({required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourcesResponse>(
      future: ApiManger.getSources(categoryModel.id),
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
                      ApiManger.getSources(categoryModel.id);
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
