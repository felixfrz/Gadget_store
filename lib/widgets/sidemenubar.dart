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
          // padding: EdgeInsets.only(
          //     top: MediaQuery.of(context).size.height * 0.1,
          //     bottom: 50,
          //     right: 50,
          //     left: 50),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.indigo,
                AppColors.MAIN_COLOR,
              ],
              stops: [0.4, 0.8],
            ),
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: Opacity(
                  opacity: 0.3,
                  child: Image.asset(
                    'assets/imgs/welcomeImage.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                child: Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.1,
                      bottom: 50,
                      right: 50,
                      left: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () async {
                          if (userLoggedIn) {
                            await loginService.signOut();
                            Navigator.of(context)
                                .pushReplacementNamed('/welcomepage');
                          } else {
                            bool success =
                                await loginService.signInWithGoogle();
                            if (success) {
                              Navigator.of(context)
                                  .pushNamed('/categorylistpage');
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
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
              )
            ],
          )),
    );
  }
}
