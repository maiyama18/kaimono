import 'package:flutter/material.dart';
import 'package:kaimono/stores/shopping_list.dart';
import 'package:provider/provider.dart';

class ShoppingListScreen extends StatefulWidget {
  @override
  _ShoppingListScreenState createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {
  FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('kaimono list'),
      ),
      body: Consumer<ShoppingList>(
        builder: (context, shoppingList, _) {
          return Column(
            children: <Widget>[
              ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, i) => Container(
                  color: Colors.grey[300],
                  height: 1,
                ),
                itemBuilder: (context, i) {
                  if (i == shoppingList.numItems) {
                    return ListTile(
                      leading: Checkbox(
                        value: false,
                        onChanged: (_) {},
                      ),
                      title: TextField(
                        autocorrect: false,
                        focusNode: _focusNode,
                        onChanged: (input) => shoppingList.updateInput(input),
                        onSubmitted: (_) => shoppingList.addToList(),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    );
                  }

                  final item = shoppingList.items[i];
                  return Dismissible(
                    key: Key(item.name),
                    background: Container(
                      color: Colors.red[300],
                    ),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      if (direction == DismissDirection.endToStart) {
                        shoppingList.removeFromList(i);
                      }
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text('「${item.name}」がリストから削除されました'),
                          action: SnackBarAction(
                            label: '再追加',
                            onPressed: shoppingList.undoRemove,
                          ),
                        ),
                      );
                    },
                    child: ListTile(
                      leading: Checkbox(
                        value: item.done,
                        onChanged: (_) {
                          shoppingList.toggle(i);
                        },
                        checkColor: Theme.of(context).toggleableActiveColor,
                      ),
                      title: Text(
                        item.name,
                        style: TextStyle(
                          decoration:
                              item.done ? TextDecoration.lineThrough : null,
                        ),
                      ),
                    ),
                  );
                },
                itemCount: shoppingList.numItems + 1,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus(_focusNode);
                  },
                  child: Container(
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
