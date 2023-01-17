import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/layout/home_screen.dart';
import 'package:news_app/module/category/news_item_details.dart';
import 'package:news_app/provider/app_provider.dart';
import 'package:news_app/shared/style/my_Theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppProvider(),
      child: MyApp(),
    ),
  );
}

late AppProvider provider;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppProvider>(context);
    initSharedPref();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        NewsItemDetails.routeName: (context) => NewsItemDetails(),
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.appLanguage),
      theme: MyTheme.lightTheme,
    );
  }
}

void initSharedPref() async {
  final prefs = await SharedPreferences.getInstance();
  String lang = prefs.getString('language') ?? 'en';
  provider.changeLanguage(lang);
}