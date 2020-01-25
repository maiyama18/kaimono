import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:kaimono/models/shopping_item.dart';

class ShoppingList with ChangeNotifier {
  String _input = '';
  List<ShoppingItem> _items = [
    ShoppingItem(name: '牛乳'),
    ShoppingItem(name: '鶏むね肉 400'),
  ];
  ShoppingItem _lastDeletedItem;
  int _lastDeletedIndex;

  void updateInput(String input) {
    _input = input;
    notifyListeners();
  }

  void addToList() {
    if (_input == '') return;

    _items.add(ShoppingItem(name: _input));
    _input = '';
    notifyListeners();
  }

  void removeFromList(int i) {
    _lastDeletedIndex = i;
    _lastDeletedItem = _items[i];

    _items.removeAt(i);
    notifyListeners();
  }

  void undoRemove() {
    if (_lastDeletedItem == null) return;

    _items.insert(_lastDeletedIndex, _lastDeletedItem);
    notifyListeners();
  }

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
