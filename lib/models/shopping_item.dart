import 'package:flutter/cupertino.dart';

class ShoppingItem {
  String name;
  bool done;

  ShoppingItem({@required this.name, this.done = false});

  void toggle() {
    done = !done;
  }
}
