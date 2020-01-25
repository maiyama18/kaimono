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
              final item = shoppingList.items[i];
              return ListTile(
                leading: Checkbox(
                  value: item.done,
                  onChanged: (value) {
                    shoppingList.toggle(i);
                  },
                  checkColor: Theme.of(context).toggleableActiveColor,
                ),
                title: Text(
                  item.name,
                  style: TextStyle(
                    decoration: item.done ? TextDecoration.lineThrough : null,
                  ),
                ),
              );
            },
            itemCount: shoppingList.numItems,
          );
        },
      ),
    );
  }
}
