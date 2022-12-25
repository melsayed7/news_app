import 'package:flutter/material.dart';
import 'package:news_app/modual/category/build_future_news_container.dart';
import 'package:news_app/modual/category/tab_item.dart';

import '../../model/SourcesResponse.dart';

class TabsNewsScreen extends StatefulWidget {
  List<Source> sourceList;

  TabsNewsScreen({required this.sourceList});

  @override
  State<TabsNewsScreen> createState() => _TabsNewsScreenState();
}

class _TabsNewsScreenState extends State<TabsNewsScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sourceList.length,
      child: Column(
        children: [
          TabBar(
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            isScrollable: true,
            indicatorColor: Colors.transparent,
            tabs: widget.sourceList
                .map((source) => TabItem(
                      source: source,
                      isSelected:
                          selectedIndex == widget.sourceList.indexOf(source),
                    ))
                .toList(),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: BuildFutureNewsContainer(
              source: widget.sourceList[selectedIndex],
            ),
          ),
        ],
      ),
    );
  }
}
