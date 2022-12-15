import 'package:flutter/material.dart';
import 'package:news_app/layout/drawer_widget.dart';
import 'package:news_app/modual/category/category_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home';

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
            title: const Text('News App'),
          ),
          drawer: Drawer(
            child: DrawerWidget(),
          ),
          body: CategoryWidget(),
        ),
      ],
    );
  }
}
