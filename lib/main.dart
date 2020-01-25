import 'package:flutter/material.dart';
import 'package:kaimono/screens/shopping_list_screen.dart';

void main() => runApp(KaimonoApp());

class KaimonoApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'kaimono',
      theme: ThemeData(
        primaryColor: Colors.blueGrey,
      ),
      home: ShoppingListScreen(),
    );
  }
}
