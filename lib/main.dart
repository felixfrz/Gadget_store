import 'package:course_store/helper/utils.dart';
import 'package:course_store/pages/categorylistpage.dart';
import 'package:course_store/pages/detailspage.dart';
import 'package:course_store/pages/mappage.dart';
import 'package:course_store/pages/onboardingpage.dart';
import 'package:course_store/pages/selectedcategorypage.dart';
import 'package:course_store/pages/splashpage.dart';
import 'package:course_store/pages/welcomepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(fontFamily: 'Raleway'),
      debugShowCheckedModeBanner: false,
      // home: DetailsPage(subCategory: Utils.getMockedCategories()[0].subCategories[0],),
      home: SplashPage(duration: 3, goToPage: WelcomePage()),
      // home: CategoryListPage(),

      // home: SelectedCategoryPage(selectedCategory: Utils.getMockedCategories()[0],)
    ),
  );
}
