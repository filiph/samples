import 'dart:collection';

import 'package:model_shopper/models/src/item.dart';
import 'package:scoped_model/scoped_model.dart';

class CartModel extends Model {
  /// Internal, private state of the cart.
  final List<Item> _items = [];

  /// An unmodifiable view of the items in the cart.
  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  /// The current total price of all items (assuming all items cost $42).
  int get totalPrice => _items.length * 42;

  /// Adds [item] to cart. This is the only way to modify the cart from outside.
  void add(Item item) {
    _items.add(item);
    // This line tells [Model] that it should rebuild the widgets that
    // depend on it.
    notifyListeners();
  }

  /// Remove all items in the cart.
  void clear() {
    _items.clear();
  }
}
