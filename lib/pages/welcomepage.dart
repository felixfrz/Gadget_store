import 'package:course_store/helper/appcolors.dart';
import 'package:course_store/helper/iconhelper.dart';
import 'package:course_store/pages/categorylistpage.dart';
import 'package:course_store/pages/onboardingpage.dart';
import 'package:course_store/widgets/iconfont.dart';
import 'package:course_store/widgets/themebutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Stack(
          children: [
            Positioned.fill(
              child: Opacity(
                opacity: 0.3,
                child: Image.asset('assets/imgs/welcomeImage.jpg',
                    fit: BoxFit.cover),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: ClipOval(
                      child: Container(
                        width: 180,
                        height: 180,
                        color: AppColors.MAIN_COLOR,
                        alignment: Alignment.center,
                        child: IconFont(
                          iconName: IconFontHelper.PHONE,
                          color: Colors.white,
                          size: 100,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  Text(
                    'Welcome',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  SizedBox(height: 40),
                  Text(
                    'Home of Gadgets.\nGood Products. On Time',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 40),
                  ThemeButton(
                    onClick: () {},
                    label: 'Try Now!',
                    highlight: Colors.red.shade900.withOpacity(0.3),
                    color: AppColors.MAIN_COLOR,
                  ),
                  //Onboarding button
                  ThemeButton(
                    label: 'Do Onboarding',
                    highlight: AppColors.MAIN_COLOR.withOpacity(0.3),
                    color: AppColors.HIGHLIGHT_DEFAULT,
                    onClick: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (contex) => OnboardingPage(),
                        ),
                      );
                    },
                  ),
                  //Custom button widget
                  ThemeButton(
                    label: 'Login',
                    color: Colors.transparent,
                    labelColor: AppColors.MAIN_COLOR,
                    highlight: AppColors.MAIN_COLOR.withOpacity(0.5),
                    borderColor: AppColors.MAIN_COLOR,
                    borderWidth: 4,
                    onClick: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => CategoryListPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}