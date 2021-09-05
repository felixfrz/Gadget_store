import 'package:course_store/helper/appcolors.dart';
import 'package:course_store/helper/iconhelper.dart';
import 'package:course_store/widgets/iconfont.dart';
import 'package:flutter/material.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  Color themeColor;
  bool showProfilePic;
  MainAppBar(
      {this.themeColor = AppColors.MAIN_COLOR, this.showProfilePic = true});
  @override
  MainAppBarState createState() => MainAppBarState();
  @override
  Size get preferredSize => new Size.fromHeight(80);
}

class MainAppBarState extends State<MainAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: IconFont(
        iconName: IconFontHelper.PHONE,
        color: widget.themeColor,
        size: 40,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      iconTheme: IconThemeData(color: widget.themeColor),
      actions: [
        Opacity(
          opacity: widget.showProfilePic ? 1 : 0,
          child: Container(
            margin: EdgeInsets.only(right: 10),
            padding: EdgeInsets.all(10.0),
            child: ClipOval(
              child: Image.asset('assets/imgs/me.png'),
            ),
          ),
        ),
      ],
    );
  }
}
