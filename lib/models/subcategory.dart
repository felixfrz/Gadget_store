import 'dart:ui';

import 'package:course_store/models/category.dart';
import 'package:course_store/models/categorypart.dart';

class SubCategory extends Category {
  double price;
  int amount;
  List<CategoryPart> parts;
  SubCategory({
    this.parts,
    String name,
    String icon,
    Color color,
    this.price = 0.0,
    this.amount = 0,
    String imgName,
  }) : super(
          name: name,
          icon: icon,
          color: color,
          imgName: imgName,
        );
}
