import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/provider/app_provider.dart';
import 'package:provider/provider.dart';

import '../../shared/style/my_color.dart';

class LanguageModelSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              provider.changeLanguage('en');
            },
            child: provider.appLanguage == 'en'
                ? getSelectedLanguage(AppLocalizations.of(context)!.english)
                : getUnSelectedLanguage(AppLocalizations.of(context)!.english),
          ),
          const SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              provider.changeLanguage('ar');
            },
            child: provider.appLanguage == 'ar'
                ? getSelectedLanguage(AppLocalizations.of(context)!.arabic)
                : getUnSelectedLanguage(AppLocalizations.of(context)!.arabic),
          ),
        ],
      ),
    );
  }

  Widget getSelectedLanguage(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: MyColor.primaryColor),
        ),
        Icon(Icons.check, size: 30, color: MyColor.primaryColor)
      ],
    );
  }

  Widget getUnSelectedLanguage(String text) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: MyColor.primaryColor),
    );
  }
}
