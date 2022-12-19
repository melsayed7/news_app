import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/modual/category/build_category_item.dart';

class CategoryHome extends StatelessWidget {
  Function onClickedCategoryItem;

  CategoryHome({required this.onClickedCategoryItem});

  @override
  Widget build(BuildContext context) {
    var categoryItem = CategoryModel.getCategoryItem(context);
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.pickCategory,
            style: Theme.of(context).textTheme.subtitle2,
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 25,
                crossAxisSpacing: 15,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    onClickedCategoryItem(categoryItem[index]);
                  },
                  child: buildCategoryItem(
                    index: index,
                    categoryModel: categoryItem[index],
                  ),
                );
              },
              itemCount: categoryItem.length,
            ),
          ),
        ],
      ),
    );
  }
}
