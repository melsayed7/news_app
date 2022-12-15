import 'package:flutter/material.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/modual/category/build_category_item.dart';

class CategoryWidget extends StatelessWidget {
  var categoryItem = CategoryModel.getCategoryItem();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Pick your category \n of interest',
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
                return buildCategoryItem(
                  index: index,
                  categoryModel: categoryItem[index],
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
