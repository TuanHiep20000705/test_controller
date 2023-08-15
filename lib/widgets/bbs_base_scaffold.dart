import 'package:flutter/material.dart';
import 'package:test_controller/modules/grocery_controller.dart';
import 'package:test_controller/widgets/bbs_base_controller.dart';

import '../models/grocery_items.dart';

class BBSScaffold<T extends BBSBaseController> extends StatefulWidget {
  final T? controller;
  final Widget? builder;

  const BBSScaffold({
    super.key,
    this.controller,
    this.builder
  }) : assert(!(builder != null && (controller == null)),
  'Provider controller can not be null');

  @override
  State<StatefulWidget> createState() => _BBSScaffoldState();
}

class _BBSScaffoldState <T extends BBSBaseController> extends State<BBSScaffold> {
  List<GroceryItem> _groceryItems = [];

  @override
  void initState() {
    _loadItems();
  }

  void _loadItems() {
    final groceryController = widget.controller as GroceryController;
    groceryController.getGroceryList().whenComplete(() {
      if (groceryController.groceryList != null) {
        setState(() {
          _groceryItems = groceryController.groceryList!;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.controller is GroceryController) {

      Widget content = const Center(child: Text('List is empty'));

      if (_groceryItems.isNotEmpty) {
        content = ListView.builder(
            itemCount: _groceryItems.length,
            itemBuilder: (ctx, index) => Dismissible(
                key: ValueKey(_groceryItems[index].id),
                child: ListTile(
                    title: Text(_groceryItems[index].name),
                    leading: Container(
                      height: 24,
                      width: 24,
                      color: _groceryItems[index].category.color,
                    ),
                    trailing: Text(_groceryItems[index].quantity.toString())
                )
            )
        );
      }

      return Scaffold(
        appBar: AppBar(
            title: const Text('Your grocery')
        ),
        body: content,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your grocery'),
      ),
    );
  }
}