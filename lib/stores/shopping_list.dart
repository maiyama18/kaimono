import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:kaimono/models/shopping_item.dart';

class ShoppingList with ChangeNotifier {
  List<ShoppingItem> _items = [
    ShoppingItem(name: '牛乳'),
    ShoppingItem(name: '鶏むね肉 400'),
  ];

  UnmodifiableListView<ShoppingItem> get items {
    return UnmodifiableListView(_items);
  }

  int get numItems {
    return _items.length;
  }

  void toggle(int i) {
    _items[i].toggle();
    notifyListeners();
  }
}
