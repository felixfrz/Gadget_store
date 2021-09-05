import 'package:course_store/widgets/iconfont.dart';
import 'package:flutter/material.dart';

class CategoryIcon extends StatelessWidget {
  Color color;
  String iconName;
  double size;
  double padding;
  CategoryIcon({this.color, this.iconName, this.size = 30, this.padding = 10});
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        color: color,
        padding: EdgeInsets.all(this.padding),
        child: IconFont(color: Colors.white, iconName: iconName, size: size),
      ),
    );
  }
}
