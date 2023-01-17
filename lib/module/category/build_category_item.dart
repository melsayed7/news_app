import 'package:flutter/material.dart';
import 'package:news_app/model/category_model.dart';

class buildCategoryItem extends StatelessWidget {
  CategoryModel categoryModel;

  int index;

  buildCategoryItem({required this.categoryModel, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(categoryModel.color),
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(index % 2 == 0 ? 0 : 25),
            bottomLeft: Radius.circular(index % 2 == 0 ? 25 : 0),
            topLeft: const Radius.circular(25),
            topRight: const Radius.circular(25),
          )),
      child: Column(
        children: [
          Image.asset(
            categoryModel.imagePath,
            height: 130,
          ),
          Text(
            categoryModel.title,
            style: Theme.of(context).textTheme.bodyText1,
          )
        ],
      ),
    );
  }
}
