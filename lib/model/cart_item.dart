import '../login_screens/home_page.dart'; // Import CourseModel dari home_page.dart (atau pindah ke models/ jika mau rapi)

class CartItem {
  final CourseModel course;
  int quantity;

  CartItem({required this.course, this.quantity = 1});

  double get totalHarga => _parseHarga(course.harga) * quantity;

  double _parseHarga(String hargaStr) {
    if (hargaStr == 'Gratis') return 0.0;
    return double.tryParse(
          hargaStr.replaceAll('Rp ', '').replaceAll('.', ''),
        ) ??
        0.0;
  }
}
