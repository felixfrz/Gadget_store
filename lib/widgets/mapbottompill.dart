import 'package:course_store/helper/appcolors.dart';
import 'package:course_store/helper/iconhelper.dart';
import 'package:course_store/models/subcategory.dart';
import 'package:course_store/services/categoryselectionservice.dart';
import 'package:course_store/widgets/categoryicon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MapButtomPill extends StatelessWidget {
  SubCategory subCategory;

  @override
  Widget build(BuildContext context) {
    CategorySelectionService catSelection =
        Provider.of<CategorySelectionService>(context, listen: false);

    subCategory = catSelection.selectedSubCategory;
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                offset: Offset.zero),
          ]),
      child: Column(
        children: [
          Container(
            color: Colors.white,
            child: Row(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    ClipOval(
                      child: Image.asset(
                        'assets/imgs/${subCategory.imgName}.jpg',
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: -10,
                      right: -10,
                      child: CategoryIcon(
                        padding: 10,
                        color: subCategory.color,
                        iconName: subCategory.icon,
                        size: 20,
                      ),
                    )
                  ],
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        subCategory.name,
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      Text('Sale by Item'),
                      Text(
                        '2km away',
                        style: TextStyle(color: subCategory.color),
                      )
                    ],
                  ),
                ),
                Icon(
                  Icons.location_pin,
                  color: subCategory.color,
                  size: 50,
                )
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(
                        image: AssetImage('assets/imgs/bayo.jpg'),
                        fit: BoxFit.cover),
                    border: Border.all(color: subCategory.color, width: 4),
                  ),
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Stephen Adebayo',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('#24 Shagari way, Asokoro\nAbuja.')
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
