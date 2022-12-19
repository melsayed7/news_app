import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/layout/drawer_widget.dart';
import 'package:news_app/model/SourcesResponse.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/modual/category/build_future_tab_container.dart';
import 'package:news_app/modual/category/category_home.dart';
import 'package:news_app/modual/category/search_widget.dart';
import 'package:news_app/modual/setting/setting_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Source? source;
  bool searchBoolean = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/image.png',
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(selectedCategory == null
                ? AppLocalizations.of(context)!.newsApp
                : selectedCategory?.title ?? ''),
            actions: [
              selectedCategory == null
                  ? Container()
                  : IconButton(
                      onPressed: () {
                        showSearch(context: context, delegate: NewsSearch());
                      },
                      icon: const Icon(
                        Icons.search_sharp,
                        size: 30,
                      ),
                    )
            ],
          ),
          drawer: Drawer(
            child: DrawerWidget(drawerCallBackFun: onSelectedDrawerItem),
          ),
          body: selectedDrawerItem == DrawerWidget.settingNumber
              ? const SettingScreen()
              : selectedCategory == null
                  ? CategoryHome(onClickedCategoryItem: onClickedCategoryItem)
                  : BuildFutureTabContainer(categoryModel: selectedCategory!),
        ),
      ],
    );
  }

  CategoryModel? selectedCategory;

  void onClickedCategoryItem(CategoryModel categoryModel) {
    selectedCategory = categoryModel;
    setState(() {});
  }

  var selectedDrawerItem = DrawerWidget.categoryNumber;

  void onSelectedDrawerItem(int selectedItem) {
    selectedDrawerItem = selectedItem;
    selectedCategory = null;
    Navigator.of(context).pop();
    setState(() {});
  }
}
