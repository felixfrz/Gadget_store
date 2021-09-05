import 'package:course_store/helper/appcolors.dart';
import 'package:course_store/helper/iconhelper.dart';
import 'package:course_store/helper/utils.dart';
import 'package:course_store/models/category.dart';
import 'package:course_store/pages/selectedcategorypage.dart';
import 'package:course_store/widgets/categorybottombar.dart';
import 'package:course_store/widgets/categorycard.dart';
import 'package:course_store/widgets/iconfont.dart';
import 'package:course_store/widgets/mainappbar.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CategoryListPage extends StatelessWidget {
  List<Category> categories = Utils.getMockedCategories();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: MainAppBar(),
      body: Container(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(
                    'Select a Category: ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.only(bottom: 120),
                    itemCount: categories.length,
                    itemBuilder: (BuildContext ctx, int index) {
                      return CategoryCard(
                        category: categories[index],
                        onCardClick: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SelectedCategoryPage(
                                selectedCategory: categories[index],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: CategoryBottomBar(),
            )
          ],
        ),
      ),
    );
  }
}