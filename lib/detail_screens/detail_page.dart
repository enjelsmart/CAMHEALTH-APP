import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/content_model.dart';
import '../providers/cart_provider.dart';

class DetailPage extends StatelessWidget {
  final CourseModel course;

  const DetailPage({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(course.judul)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (course.gambar != null && course.gambar!.isNotEmpty) ...[
              Image.asset(course.gambar!, width: double.infinity, height: 200, fit: BoxFit.cover, errorBuilder: (_, __, ___) => const SizedBox(height: 200, child: Center(child: Icon(Icons.broken_image)))),
              const SizedBox(height: 12),
            ],
            Text(course.judul, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(course.deskripsi ?? '', style: const TextStyle(fontSize: 14)),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.add_shopping_cart),
                    label: const Text('Tambah ke Keranjang'),
                    onPressed: () {
                      Provider.of<CartProvider>(context, listen: false).addCourse(course);
                      // Hapus snackbar lama, ganti dengan navigasi
                      Navigator.pushNamed(context, '/checkout'); // Navigasi ke CheckoutPage
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}