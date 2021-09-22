import 'package:course_store/models/category.dart';
import 'package:course_store/models/subcategory.dart';
import 'package:course_store/pages/selectedcategorypage.dart';

class CategorySelectionService {
  Category _selectedCategory;
  SubCategory _selectedSubCategory;

  Category get selectedCategory => _selectedCategory;
  set selectedCategory(Category value) {
    _selectedCategory = value;
  }

  // ignore: unnecessary_getters_setters
  SubCategory get selectedSubCategory => _selectedSubCategory;
  set selectedSubCategory(SubCategory value) {
    _selectedSubCategory = value;
  }
}
