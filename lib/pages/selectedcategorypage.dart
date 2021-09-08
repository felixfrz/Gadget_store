import 'package:course_store/helper/appcolors.dart';
import 'package:course_store/helper/iconhelper.dart';
import 'package:course_store/models/category.dart';
import 'package:course_store/pages/detailspage.dart';
import 'package:course_store/widgets/categoryicon.dart';
import 'package:course_store/widgets/iconfont.dart';
import 'package:course_store/widgets/mainappbar.dart';
import 'package:flutter/material.dart';

class SelectedCategoryPage extends StatelessWidget {
  Category selectedCategory;
  SelectedCategoryPage({this.selectedCategory});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CategoryIcon(
                  color: selectedCategory.color,
                  iconName: selectedCategory.icon,
                ),
                SizedBox(width: 10),
                Text(
                  selectedCategory.name,
                  style: TextStyle(
                    color: selectedCategory.color,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(
                  selectedCategory.subCategories.length,
                  (index) => GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsPage(
                            subCategory: selectedCategory.subCategories[index],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      child: Column(
                        children: [
                          ClipOval(
                            child: Image.asset(
                              'assets/imgs/' +
                                  selectedCategory
                                      .subCategories[index].imgName +
                                  '.jpg',
                              fit: BoxFit.cover,
                              width: 100,
                              height: 100,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            selectedCategory.subCategories[index].name,
                            style: TextStyle(color: selectedCategory.color),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
