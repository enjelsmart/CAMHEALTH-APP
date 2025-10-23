import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../model/cart_item.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final items = cart.items;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout & Pembayaran'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: items.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.shopping_cart_outlined, size: 100, color: Colors.grey),
                    const SizedBox(height: 16),
                    const Text('Keranjang Anda kosong', style: TextStyle(fontSize: 18)),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context), // Kembali ke halaman sebelumnya
                      child: const Text('Kembali ke Home'),
                    ),
                  ],
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Ringkasan Keranjang',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, i) {
                        final CartItem item = items[i];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: ListTile(
                            leading: item.course.gambar != null && item.course.gambar!.isNotEmpty
                                ? Image.asset(item.course.gambar!, width: 56, fit: BoxFit.cover)
                                : const Icon(Icons.image_not_supported),
                            title: Text(item.course.judul),
                            subtitle: Text('${item.course.harga ?? 'Gratis'} x ${item.quantity}'),
                            trailing: Text('Rp ${item.totalHarga.toStringAsFixed(0)}'),
                          ),
                        );
                      },
                    ),
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Total Pembayaran:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('Rp ${cart.totalPrice.toStringAsFixed(0)}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Pilih Metode Pembayaran:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 8),
                  // Contoh dropdown untuk metode pembayaran (bisa dikembangkan)
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Metode Pembayaran',
                    ),
                    items: const [
                      DropdownMenuItem(value: 'transfer', child: Text('Transfer Bank')),
                      DropdownMenuItem(value: 'ewallet', child: Text('E-Wallet (GoPay, OVO, dll.)')),
                      DropdownMenuItem(value: 'credit', child: Text('Kartu Kredit')),
                    ],
                    onChanged: (value) {
                      // Logika untuk memilih metode (bisa simpan di state atau provider)
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Metode dipilih: $value')));
                    },
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // Implementasi pembayaran (misalnya, panggil API payment gateway)
                            // Untuk sekarang, tampilkan dialog sukses dan clear keranjang
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Pembayaran Berhasil'),
                                content: const Text('Terima kasih! Kursus Anda akan segera diakses.'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      cart.clear(); // Kosongkan keranjang setelah pembayaran
                                      Navigator.pop(context); // Tutup dialog
                                      Navigator.pop(context); // Kembali ke home atau halaman sebelumnya
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: const Text('Bayar Sekarang'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}