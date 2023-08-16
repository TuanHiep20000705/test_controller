import 'package:test_controller/data/repository/grocery_repository.dart';
import 'package:test_controller/models/grocery_items.dart';
import 'package:test_controller/widgets/bbs_base_controller.dart';

class GroceryController extends BBSBaseController {
  final _repository = GroceryRepository();

  List<GroceryItem>? _groceryList;

  List<GroceryItem>? get groceryList => _groceryList;

  set groceryList(List<GroceryItem>? groceryItems) {
    _groceryList = groceryItems;
    notifyListeners();
  }

  Future getGroceryList() async {
    try {
      final resp = await _repository.getGroceryList();
      groceryList = resp;
    } catch (e) {
      print(e);
    }
  }
}