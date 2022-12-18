import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/layout/drawer_widget.dart';
import 'package:news_app/model/SourcesResponse.dart';
import 'package:news_app/modual/category/build_future_tab_container.dart';
import 'package:news_app/modual/category/category_home.dart';
import 'package:news_app/modual/setting/setting_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home';
  Source? source;

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
            title: Text(AppLocalizations.of(context)!.newsApp),
          ),
          drawer: Drawer(
            child: DrawerWidget(drawerCallBackFun: chosenDrawerItem),
          ),
          body: BuildFutureTabContainer(),
        ),
      ],
    );
  }

  void chosenDrawerItem() {
    if (CategoryHome == DrawerWidget.categoryNumber) {
      CategoryHome();
    } else if (CategoryHome == DrawerWidget.settingNumber) {
      SettingScreen();
    }
  }
}
