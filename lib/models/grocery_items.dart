import 'package:json_annotation/json_annotation.dart';
import 'package:test_controller/models/grocery_items.g.dart';

import 'category.dart';
import 'package:test_controller/models/grocery_items.dart';

@JsonSerializable()
class GroceryItem {
  const GroceryItem({
    required this.id,
    required this.name,
    required this.quantity,
    required this.category,
  });

  final String id;
  final String name;
  final int quantity;
  final Category category;

  factory GroceryItem.fromJson(Map<String, dynamic> json) =>
      GroceryItemFromJson(json);
  Map<String, dynamic> toJson() => GroceryItemToJson(this);
}