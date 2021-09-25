import 'package:course_store/models/category.dart';
import 'package:course_store/models/subcategory.dart';
import 'package:course_store/pages/selectedcategorypage.dart';
import 'package:flutter/cupertino.dart';

class CategorySelectionService extends ChangeNotifier {
  Category _selectedCategory;
  SubCategory _selectedSubCategory;

  Category get selectedCategory => _selectedCategory;
  set selectedCategory(Category value) {
    _selectedCategory = value;
    notifyListeners();
  }

  // ignore: unnecessary_getters_setters
  SubCategory get selectedSubCategory => _selectedSubCategory;
  set selectedSubCategory(SubCategory value) {
    _selectedSubCategory = value;
    notifyListeners();
  }

  void incrementSubCategoryAmount() {
    if (_selectedSubCategory != null) {
      _selectedSubCategory.amount++;
      notifyListeners();
    }
  }

  void decrementSubCategoryAmount() {
    if (_selectedSubCategory != null) {
      _selectedSubCategory.amount--;
      notifyListeners();
    }
  }

  int get subCategoryAmount {
    int subCatAmount = 0;
    if (_selectedSubCategory != null) {
      subCatAmount = _selectedSubCategory.amount;
    }
    return subCatAmount;
  }
}
