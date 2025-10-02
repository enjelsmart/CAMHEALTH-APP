import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String judul;
  final String deskripsi;
  final String? gambarPath;      
  final String? gambarBesarPath; 

  const DetailPage({
    Key? key,
    required this.judul,
    required this.deskripsi,
    this.gambarPath,
    this.gambarBesarPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(judul)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            if (gambarBesarPath != null) ...[
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  gambarBesarPath!,
                  width: double.infinity,  
                  height: 250,             
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: double.infinity,
                    height: 250,
                    color: Colors.grey[300],
                    child: const Icon(Icons.image_not_supported, size: 50, color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(height: 16), 
            ],

           
            Row(
              children: [
                Expanded(
                  child: Text(
                    judul,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
                if (gambarPath != null) ...[
                  const SizedBox(width: 16),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      gambarPath!,
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        width: 120,
                        height: 120,
                        color: Colors.grey[300],
                        child: const Icon(Icons.image_not_supported, color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ],
            ),

            const SizedBox(height: 16),

            
            Text(
              deskripsi,
              style: const TextStyle(
                fontSize: 16,
                height: 1.5,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}