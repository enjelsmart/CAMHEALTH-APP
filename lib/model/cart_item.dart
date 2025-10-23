import 'content_model.dart';

class CartItem {
  final CourseModel course;
  int quantity;

  CartItem({required this.course, this.quantity = 1});

  double get totalHarga {
    final cleaned = course.harga.replaceAll(RegExp(r'[^0-9.]'), '');
    final hargaNum = double.tryParse(cleaned) ?? 0.0;
    return hargaNum * quantity;
  }
}