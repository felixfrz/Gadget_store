import 'package:course_store/models/loginusermodel.dart';
import 'package:course_store/services/loginservice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserProfileHeader extends StatelessWidget {
  final bool showProfilePic;
  UserProfileHeader({this.showProfilePic});

  @override
  Widget build(BuildContext context) {
    LoginService loginService =
        Provider.of<LoginService>(context, listen: false);
    LoginUserModel userModel = loginService.loggedInUserModel;
    String imgPath = userModel != null ? userModel.photoUrl : '';
    return showProfilePic && imgPath.length > 0
        ? Container(
            margin: EdgeInsets.only(right: 10),
            padding: EdgeInsets.all(10.0),
            child: ClipOval(
              child: Image.network(imgPath),
            ),
          )
        : SizedBox(width: 40, height: 40);
  }
}
