import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../model/cart_item.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final items = cart.items;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Keranjang Saya'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: items.isEmpty
            ? const Center(child: Text('Keranjang kosong'))
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, i) {
                        final CartItem item = items[i];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          child: ListTile(
                            leading: item.course.gambar != null && item.course.gambar!.isNotEmpty
                                ? Image.asset(item.course.gambar!, width: 56, fit: BoxFit.cover)
                                : const Icon(Icons.image_not_supported),
                            title: Text(item.course.judul),
                            subtitle: Text(item.course.harga ?? 'Gratis'),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove_circle_outline),
                                  onPressed: () => cart.changeQuantity(item, item.quantity - 1),
                                ),
                                Text('${item.quantity}', style: const TextStyle(fontSize: 16)),
                                IconButton(
                                  icon: const Icon(Icons.add_circle_outline),
                                  onPressed: () => cart.changeQuantity(item, item.quantity + 1),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete, color: Colors.red),
                                  onPressed: () => cart.removeCourse(item.course),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total: Rp ${cart.totalPrice.toStringAsFixed(0)}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Fitur checkout belum diimplementasikan')));
                        },
                        child: const Text('Checkout'),
                      )
                    ],
                  )
                ],
              ),
      ),
    );
  }
}