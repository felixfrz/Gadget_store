import 'package:course_store/helper/utils.dart';
import 'package:course_store/models/category.dart';
import 'package:course_store/pages/selectedcategorypage.dart';
import 'package:course_store/services/categoryselectionservice.dart';
import 'package:course_store/widgets/categorybottombar.dart';
import 'package:course_store/widgets/categorycard.dart';
import 'package:course_store/widgets/mainappbar.dart';
import 'package:course_store/widgets/sidemenubar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CategoryListPage extends StatelessWidget {
  List<Category> categories = Utils.getMockedCategories();
  @override
  Widget build(BuildContext context) {
    CategorySelectionService catSelection =
        Provider.of<CategorySelectionService>(context, listen: false);

    return Scaffold(
      drawer: Drawer(
        child: SideMenuBar(),
      ),
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
                          catSelection.selectedCategory = categories[index];
                          Navigator.of(context)
                              .pushNamed('/selectedcategorypage');
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
