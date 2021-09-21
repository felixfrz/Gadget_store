import 'package:course_store/helper/appcolors.dart';
import 'package:course_store/helper/iconhelper.dart';
import 'package:course_store/widgets/iconfont.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SplashPage extends StatelessWidget {
  int duration = 0;
  Widget goToPage;
  SplashPage({this.duration, this.goToPage});
  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(seconds: this.duration),
      () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => this.goToPage),
        );
      },
    );
    return Scaffold(
      body: Container(
        color: AppColors.MAIN_COLOR,
        alignment: Alignment.center,
        child: IconFont(
          color: Colors.white,
          iconName: IconFontHelper.PHONE,
          size: 100,
        ),
      ),
    );
  }
}


// setVisitingFlag()async{
//   SharedPreferences preferences = await SharedPreferences.getInstance();
//   preferences.setBool('alreadyVisited', true);
// }
// getVisitingFlag()async{
//   SharedPreferences preferences = await SharedPreferences.getInstance();
//   bool alreadyVisited = preferences.getBool('alreadyVisted') ?? false;
//   return alreadyVisited;
// }