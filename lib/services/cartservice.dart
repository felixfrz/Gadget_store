import 'dart:collection';

import 'package:course_store/models/cartitem.dart';
import 'package:course_store/models/subcategory.dart';
import 'package:flutter/cupertino.dart';

class CartService extends ChangeNotifier {
  final List<CartItem> _items = [];

  UnmodifiableListView<CartItem> get items => UnmodifiableListView(_items);
  void add(CartItem item) {
    _items.add(item);
    notifyListeners();
  }

  bool isSubCategoryAddedToCart(SubCategory cat) {
    return _items.length > 0
        ? _items.any((CartItem item) => item.category.name == cat.name)
        : false;
  }
}
