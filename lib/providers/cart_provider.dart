// ...existing code...
import 'package:flutter/foundation.dart';
import '../model/cart_item.dart';
import '../model/content_model.dart';

class CartProvider extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);
  int get itemCount => _items.fold(0, (s, i) => s + i.quantity);
  double get totalPrice => _items.fold(0.0, (s, i) => s + i.totalHarga);

  void addCourse(CourseModel course) {
    final idx = _items.indexWhere((c) => c.course.judul == course.judul);
    if (idx >= 0) {
      _items[idx].quantity++;
    } else {
      _items.add(CartItem(course: course));
    }
    notifyListeners();
  }

  void removeCourse(CourseModel course) {
    _items.removeWhere((c) => c.course.judul == course.judul);
    notifyListeners();
  }

  void changeQuantity(CartItem item, int qty) {
    final idx = _items.indexOf(item);
    if (idx >= 0) {
      if (qty <= 0) {
        _items.removeAt(idx);
      } else {
        _items[idx].quantity = qty;
      }
      notifyListeners();
    }
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}
