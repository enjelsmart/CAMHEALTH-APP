import 'content_model.dart';

class CartItem {
  final CourseModel course;
  int quantity;

  CartItem({required this.course, this.quantity = 1});

  double get totalHarga {
    // ambil angka dari string harga (mis. "Rp 75.000" -> 75000)
    final cleaned = course.harga.replaceAll(RegExp(r'[^0-9.]'), '');
    final hargaNum = double.tryParse(cleaned) ?? 0.0;
    return hargaNum * quantity;
  }
}