import 'package:flutter/material.dart';
import 'package:news_app/model/SourcesResponse.dart';
import 'package:news_app/shared/style/my_color.dart';

class TabItem extends StatelessWidget {
  Source source;

  bool isSelected;

  TabItem({required this.source, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isSelected == true ? MyColor.primaryColor : Colors.transparent,
        border: Border.all(color: MyColor.primaryColor, width: 2),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Text(
        source.name ?? '',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: isSelected == true ? MyColor.whiteColor : MyColor.primaryColor,
        ),
      ),
    );
  }
}
