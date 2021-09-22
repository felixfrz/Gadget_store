import 'package:course_store/pages/categorylistpage.dart';
import 'package:course_store/pages/detailspage.dart';
import 'package:course_store/pages/mappage.dart';
import 'package:course_store/pages/onboardingpage.dart';
import 'package:course_store/pages/selectedcategorypage.dart';
import 'package:course_store/pages/splashpage.dart';
import 'package:course_store/pages/welcomepage.dart';
import 'package:course_store/services/categoryselectionservice.dart';
import 'package:course_store/services/loginservice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(
          create: (_) => LoginService(),
        ),
        Provider(
          create: (_) => CategorySelectionService(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'Raleway'),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => SplashPage(duration: 3, goToPage: WelcomePage()),
          '/welcomepage': (context) => WelcomePage(),
          '/categorylistpage': (context) => CategoryListPage(),
          '/selectedcategorypage': (context) => SelectedCategoryPage(),
          '/detailspage': (context) => DetailsPage(),
          '/mappage': (context) => MapPage(),
          '/onboardingpage': (context) => OnboardingPage(),
        },
      ),
    ),
  );
}
