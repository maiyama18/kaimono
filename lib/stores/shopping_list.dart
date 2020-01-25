import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:kaimono/models/shopping_item.dart';

class ShoppingList with ChangeNotifier {
  List<ShoppingItem> _items = [
    ShoppingItem(name: 'milk'),
    ShoppingItem(name: 'eggs'),
  ];

  UnmodifiableListView<ShoppingItem> get items {
    return UnmodifiableListView(_items);
  }

  int get numItems {
    return _items.length;
  }
}
