import 'package:course_store/helper/appcolors.dart';
import 'package:course_store/models/subcategory.dart';
import 'package:course_store/pages/mappage.dart';
import 'package:course_store/widgets/categoryicon.dart';
import 'package:course_store/widgets/categorypartslist.dart';
import 'package:course_store/widgets/mainappbar.dart';
import 'package:course_store/widgets/themebutton.dart';
import 'package:course_store/widgets/unitpricewidget.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  SubCategory subCategory;
  DetailsPage({this.subCategory});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
              ),
              child: Stack(
                children: [
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/imgs/' +
                              widget.subCategory.imgName +
                              '_desc.jpg'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black.withOpacity(0.6),
                            Colors.transparent
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CategoryIcon(
                            color: widget.subCategory.color,
                            iconName: widget.subCategory.icon,
                            size: 50,
                          ),
                          Column(
                            children: [
                              Text(
                                'Hp Laptop parts',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: widget.subCategory.color,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text('\$15 - \$197',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white)),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: 20,
                    top: 120,
                    child: Container(
                      padding: EdgeInsets.only(
                          top: 5, left: 15, right: 15, bottom: 8),
                      decoration: BoxDecoration(
                          color: AppColors.MAIN_COLOR,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              blurRadius: 20,
                              offset: Offset.zero,
                            )
                          ]),
                      child: Row(
                        children: [
                          Text(
                            '3',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          Icon(
                            Icons.shopping_cart,
                            color: Colors.white,
                            size: 15,
                          )
                        ],
                      ),
                    ),
                  ),
                  MainAppBar(
                    themeColor: Colors.white,
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    //Category Parts List
                    CategoryPartsList(subCategory: widget.subCategory),
                    //Price Unit Section
                    UnitPriceWidget(),
                    //Theme Buttons
                    ThemeButton(
                      label: 'Add to cart',
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                      highlight: AppColors.HIGHLIGHT_DEFAULT.withOpacity(0.3),
                      onClick: () {},
                    ),
                    ThemeButton(
                      labelColor: AppColors.MAIN_COLOR,
                      label: 'Product Location',
                      icon: Icon(
                        Icons.location_pin,
                        color: AppColors.MAIN_COLOR,
                      ),
                      onClick: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MapPage(),
                          ),
                        );
                      },
                      color: AppColors.HIGHLIGHT_DEFAULT,
                      highlight: AppColors.MAIN_COLOR.withOpacity(0.3),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
