import 'package:flutter/material.dart';
import 'package:kaimono/screens/shopping_list_screen.dart';
import 'package:kaimono/stores/shopping_list.dart';
import 'package:provider/provider.dart';

void main() => runApp(KaimonoApp());

class KaimonoApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => ShoppingList(),
      child: MaterialApp(
        title: 'kaimono',
        theme: ThemeData(
          primaryColor: Colors.blueGrey,
        ),
        home: ShoppingListScreen(),
      ),
    );
  }
}
