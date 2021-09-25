import 'package:course_store/helper/appcolors.dart';
import 'package:course_store/models/subcategory.dart';
import 'package:course_store/services/categoryselectionservice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class UnitPriceWidget extends StatefulWidget {
  Color themeColor;
  int amount = 0;
  double price = 15.0;
  double cost = 0.0;
  UnitPriceWidget({
    this.price,
    this.themeColor = AppColors.MAIN_COLOR,
  });

  @override
  _UnitPriceWidgetState createState() => _UnitPriceWidgetState();
}

class _UnitPriceWidgetState extends State<UnitPriceWidget> {
  @override
  Widget build(BuildContext context) {
    CategorySelectionService catSelection =
        Provider.of<CategorySelectionService>(context);
    SubCategory subCategory = catSelection.selectedSubCategory;
    widget.themeColor = subCategory.color;
    widget.price = subCategory.price;

    return Column(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text.rich(
                TextSpan(children: [
                  TextSpan(text: 'Item: '),
                  TextSpan(
                      text: 'Part ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: 'max. 10', style: TextStyle(fontSize: 12)),
                ]),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      offset: Offset.zero,
                      color: Colors.black.withOpacity(0.1),
                    )
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: catSelection.selectedSubCategory.amount < 10
                        ? () {
                            // setState(() {
                            //   widget.amount++;
                            //   widget.cost = widget.price * widget.amount;
                            // });
                            catSelection.selectedSubCategory.amount++;
                            catSelection.selectedSubCategory =
                                catSelection.selectedSubCategory;
                          }
                        : null,
                    child: Icon(
                      Icons.add_circle_outline,
                      size: 50,
                      color: catSelection.selectedSubCategory.amount < 10
                          ? widget.themeColor
                          : widget.themeColor.withOpacity(0.2),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Consumer<CategorySelectionService>(
                          builder: (context, cat, child) {
                        return Center(
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                    text:
                                        catSelection.selectedSubCategory != null
                                            ? catSelection
                                                .selectedSubCategory.amount
                                                .toString()
                                            : '0',
                                    style: TextStyle(fontSize: 40)),
                                TextSpan(
                                    text: 'itms',
                                    style: TextStyle(fontSize: 20)),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  GestureDetector(
                    onTap: catSelection.selectedSubCategory.amount > 0
                        ? () {
                            // setState(() {
                            //   widget.amount--;
                            //   widget.cost = widget.price * widget.amount;
                            // });
                            catSelection.selectedSubCategory.amount--;
                            catSelection.selectedSubCategory =
                                catSelection.selectedSubCategory;
                          }
                        : null,
                    child: Icon(
                      Icons.remove_circle_outline,
                      size: 50,
                      color: catSelection.selectedSubCategory.amount > 0
                          ? Colors.grey
                          : Colors.grey[100],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, right: 20, left: 20, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: 'Price: '),
                        TextSpan(
                          text: '\$${widget.price} / item',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Text(
                    '\$${widget.cost}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
