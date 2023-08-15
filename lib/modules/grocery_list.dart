import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_controller/modules/grocery_controller.dart';
import 'package:test_controller/widgets/bbs_base_scaffold.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<StatefulWidget> createState() {
    return _GroceryListState();
  }
}

class _GroceryListState extends State<GroceryList> {
  @override
  Widget build(BuildContext context) {
    return BBSScaffold<GroceryController>(
      controller: GroceryController(),
    );
  }
}