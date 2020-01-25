import 'package:flutter/material.dart';
import 'package:kaimono/stores/shopping_list.dart';
import 'package:provider/provider.dart';

class ShoppingListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('kaimono list'),
      ),
      body: Consumer<ShoppingList>(
        builder: (context, shoppingList, _) {
          return ListView.builder(
            itemBuilder: (context, i) {
              return ListTile(
                title: Text(shoppingList.items[i].name),
              );
            },
            itemCount: shoppingList.numItems,
          );
        },
      ),
    );
  }
}
