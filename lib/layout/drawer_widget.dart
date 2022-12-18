import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/shared/style/my_color.dart';

class DrawerWidget extends StatelessWidget {
  static const int categoryNumber = 1;
  static const int settingNumber = 2;

  Function drawerCallBackFun;

  DrawerWidget({required this.drawerCallBackFun});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 64),
          color: MyColor.primaryColor,
          child: Text(
            AppLocalizations.of(context)!.newsApp,
            style: Theme.of(context).textTheme.headline2,
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: InkWell(
            onTap: () {
              drawerCallBackFun(categoryNumber);
            },
            child: Row(
              children: [
                const Icon(
                  Icons.list,
                  size: 34,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  AppLocalizations.of(context)!.categories,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: InkWell(
            onTap: () {
              drawerCallBackFun(settingNumber);
            },
            child: Row(
              children: [
                const Icon(
                  Icons.settings,
                  size: 34,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  AppLocalizations.of(context)!.settings,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
