import 'package:course_store/helper/appcolors.dart';
import 'package:course_store/helper/iconhelper.dart';
import 'package:course_store/widgets/iconfont.dart';
import 'package:course_store/widgets/userprofileheader.dart';
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
      title: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed('/categorylistpage');
        },
        child: Center(
          child: IconFont(
            iconName: IconFontHelper.PHONE,
            color: widget.themeColor,
            size: 40,
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      iconTheme: IconThemeData(color: widget.themeColor),
      actions: [
        UserProfileHeader(showProfilePic: widget.showProfilePic),
      ],
    );
  }
}

// class MainAppBar extends StatelessWidget with PreferredSizeWidget {
//   static const double _topBarHeight = 60;
//   Color themeColor;
//   bool showProfilePic;
//   MainAppBar(
//       {this.themeColor = AppColors.MAIN_COLOR, this.showProfilePic = true});
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       centerTitle: true,
//       title: IconFont(
//         iconName: IconFontHelper.PHONE,
//         color: themeColor,
//         size: 40,
//       ),
//       backgroundColor: Colors.transparent,
//       elevation: 0.0,
//       iconTheme: IconThemeData(color: themeColor),
//       actions: [
//         UserProfileHeader(showProfilePic: showProfilePic),
//       ],
//       toolbarHeight: _topBarHeight,
//       automaticallyImplyLeading: false,
//       leading: _buildLeadingWidget(context),
//     );
//   }

//   @override
//   Size get preferredSize => Size.fromHeight(_topBarHeight);

//   Widget _buildLeadingWidget(BuildContext context) {
//     final ScaffoldState scaffold = Scaffold.of(context);
//     final ModalRoute<dynamic> parentRoute = ModalRoute.of(context);

//     final bool canPop = ModalRoute.of(context)?.canPop ?? false;
//     final bool hasDrawer = scaffold?.hasDrawer ?? false;
//     final bool useCloseButton =
//         parentRoute is PageRoute<dynamic> && parentRoute.fullscreenDialog;

//     Widget leading;
//     if (hasDrawer) {
//       leading = IconButton(
//         icon: const Icon(
//           Icons.menu_rounded,
//           size: 38,
//         ),
//         onPressed: Scaffold.of(context).openDrawer,
//         tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
//       );
//     } else {
//       if (canPop) {
//         if (useCloseButton) {
//           leading = IconButton(
//               color: Theme.of(context).colorScheme.onBackground,
//               icon: Icon(Icons.close_rounded, size: 38),
//               onPressed: () => Navigator.of(context).maybePop());
//         } else {
//           leading = IconButton(
//             padding: EdgeInsets.all(0),
//             iconSize: 38,
//             icon: Icon(Icons.arrow_back_ios, size: 38),
//             onPressed: Navigator.of(context).pop,
//           );
//         }
//       }
//     }

//     return leading;
//   }
// }
