import 'package:course_store/helper/appcolors.dart';
import 'package:course_store/helper/iconhelper.dart';
import 'package:course_store/pages/categorylistpage.dart';
import 'package:course_store/pages/welcomepage.dart';
import 'package:course_store/services/loginservice.dart';
import 'package:course_store/widgets/iconfont.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SideMenuBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginService loginService =
        Provider.of<LoginService>(context, listen: false);
    bool userLoggedIn = loginService.loggedInUserModel != null;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(50),
        color: AppColors.MAIN_COLOR,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () async {
                if (userLoggedIn) {
                  await loginService.signOut();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WelcomePage()));
                } else {
                  bool success = await loginService.signInWithGoogle();
                  if (success) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategoryListPage()));
                  }
                }
              },
              child: Row(
                children: [
                  Icon(
                    userLoggedIn ? Icons.logout : Icons.login,
                    color: Colors.white,
                    size: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    userLoggedIn ? 'Sign Out' : 'Sign In',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )
                ],
              ),
            ),
            IconFont(
              iconName: IconFontHelper.PHONE,
              size: 70,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
