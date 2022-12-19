import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/modual/setting/language_model_sheet.dart';
import 'package:news_app/shared/style/my_color.dart';
import 'package:provider/provider.dart';

import '../../provider/app_provider.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Container(
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
                color: MyColor.whiteColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: MyColor.primaryColor)),
            child: InkWell(
              onTap: () {
                showLanguageModelSheet(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.appLanguage == 'en'
                        ? AppLocalizations.of(context)!.english
                        : AppLocalizations.of(context)!.arabic,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(fontSize: 18, color: MyColor.primaryColor),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    size: 40,
                    color: MyColor.primaryColor,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showLanguageModelSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => LanguageModelSheet(),
    );
  }
}
