import 'package:test_controller/models/grocery_items.dart';

GroceryItem GroceryItemFromJson(Map<String, dynamic> json) => GroceryItem(
    id: json['name'] as String? ?? '',
    name: json['name'] as String? ?? '',
    quantity: json['quantity'] as int? ?? -1,
    category: json['selectedCategory']
);

Map<String, dynamic> GroceryItemToJson (GroceryItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'quantity': instance.quantity,
      'selectedCategory': instance.category
    };