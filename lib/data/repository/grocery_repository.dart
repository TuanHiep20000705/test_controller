import 'dart:convert';

import 'package:test_controller/data/api_client.dart';
import 'package:test_controller/models/grocery_items.dart';

import '../categories.dart';

class GroceryRepository {
  Future<List<GroceryItem>> getGroceryList() async {
    var response = await ApiClient.instanceEC.get('https://flutter-prep-f5f13-default-rtdb.firebaseio.com/shopping-list.json');
    final Map<String, dynamic> listData = response.data;
    final List<GroceryItem> loadedItems = [];
    for (final item in listData.entries) {
      final category = categories.entries
          .firstWhere((catItem) =>
      catItem.value.title == item.value['selectedCategory'])
          .value;
      loadedItems.add(GroceryItem(
          id: item.key,
          name: item.value['name'],
          quantity: item.value['quantity'],
          category: category));
    }
    return loadedItems;
  }
}