import 'package:course_store/helper/appcolors.dart';
import 'package:flutter/material.dart';

class CategoryBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.black.withOpacity(0.2),
            offset: Offset.zero,
          )
        ],
      ),
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ClipOval(
            child: Material(
              child: IconButton(
                icon: Icon(Icons.favorite, color: AppColors.MAIN_COLOR),
                onPressed: () {},
              ),
            ),
          ),
          ClipOval(
            child: Material(
              child: IconButton(
                icon: Icon(Icons.shopping_cart, color: AppColors.MAIN_COLOR),
                onPressed: () {},
              ),
            ),
          ),
          ClipOval(
            child: Material(
              child: IconButton(
                icon: Icon(Icons.pin_drop, color: AppColors.MAIN_COLOR),
                onPressed: () {},
              ),
            ),
          ),
          ClipOval(
            child: Material(
              child: IconButton(
                icon: Icon(Icons.settings, color: AppColors.MAIN_COLOR),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
