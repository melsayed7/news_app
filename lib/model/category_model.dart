import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoryModel {
  String id;
  String imagePath;
  String title;
  int color;

  CategoryModel(
      {required this.id,
      required this.imagePath,
      required this.title,
    required this.color});

  static List<CategoryModel> getCategoryItem(BuildContext context) {
    return [
      CategoryModel(
          id: 'sports',
          imagePath: 'assets/images/sports.png',
          title: AppLocalizations.of(context)!.sports,
          color: 0xffC91C22),
      CategoryModel(
          id: 'entertainment',
          imagePath: 'assets/images/environment.png',
          title: AppLocalizations.of(context)!.environment,
          color: 0xff4882CF),
      CategoryModel(
          id: 'technology',
          imagePath: 'assets/images/Politics.png',
          title: AppLocalizations.of(context)!.technology,
          color: 0xff003E90),
      CategoryModel(
          id: 'health',
          imagePath: 'assets/images/health.png',
          title: AppLocalizations.of(context)!.health,
          color: 0xffED1E79),
      CategoryModel(
          id: 'business',
          imagePath: 'assets/images/bussines.png',
          title: AppLocalizations.of(context)!.business,
          color: 0xffCF7E48),
      CategoryModel(
          id: 'science',
          imagePath: 'assets/images/science.png',
          title: AppLocalizations.of(context)!.science,
          color: 0xffF2D352),
      CategoryModel(
          id: 'general',
          imagePath: 'assets/images/environment.png',
          title: AppLocalizations.of(context)!.general,
          color: 0xff003E90),
    ];
  }
}
//technology
