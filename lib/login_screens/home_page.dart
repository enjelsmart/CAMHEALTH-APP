import 'package:flutter/material.dart';
import 'package:new_flutter/detail_screens/detail_page.dart';

abstract class ContentModel {
  final String _judul;
  final String _deskripsi;
  final String? _gambar;

  ContentModel({required String judul, required String deskripsi, String? gambar})
      : _judul = judul, _deskripsi = deskripsi, _gambar = gambar;

  String get judul => _judul;
  String get deskripsi => _deskripsi;
  String? get gambar => _gambar;

  String getDetailInfo();
}

class ArtikelModel extends ContentModel {
  ArtikelModel({required String judul, required String deskripsi, String? gambar})
      : super(judul: judul, deskripsi: deskripsi, gambar: gambar);

  @override
  String getDetailInfo() => deskripsi.length > 50 ? '${deskripsi.substring(0, 50)}...' : deskripsi;
}

class CourseModel extends ContentModel {
  final String _durasi;
  final String _level;
  final String _harga;

  CourseModel({required String judul, required String deskripsi, required String durasi, required String level, required String gambar, required String harga})
      : _durasi = durasi, _level = level, _harga = harga, super(judul: judul, deskripsi: deskripsi, gambar: gambar);

  String get durasi => _durasi;
  String get level => _level;
  String get harga => _harga;

  @override
  String getDetailInfo() => 'Durasi: $durasi | Level: $level | Harga: $harga';
}

class HomePage extends StatefulWidget {
  final VoidCallback? onLogout;

  const HomePage({super.key, this.onLogout});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<CourseModel> daftarCourses = [
    CourseModel(judul: '5 Cara Efektif Mengurangi Stres', deskripsi: 'Pelajari teknik relaksasi dan manajemen stres yang mudah dilakukan.', durasi: 'Self-paced', level: 'Pemula', gambar: 'assets/image/gambar11.jpg', harga: 'Gratis'),
    CourseModel(judul: 'Panduan Meditasi untuk Pemula', deskripsi: 'Instruksi langkah demi langkah meditasi mindfulness untuk keseharian.', durasi: 'Self-paced', level: 'Pemula', gambar: '', harga: 'Gratis'),
    CourseModel(judul: 'Menjaga Kesehatan Mental di Tempat Kerja', deskripsi: 'Tips menjaga fokus dan mengurangi tekanan kerja.', durasi: 'Self-paced', level: 'Pemula', gambar: '', harga: 'Gratis'),
    CourseModel(judul: 'Manfaat Jurnal Harian bagi Emosi', deskripsi: 'Cara menulis jurnal dapat membantu memahami dan mengelola perasaan.', durasi: 'Self-paced', level: 'Pemula', gambar: '', harga: 'Gratis'),
    CourseModel(judul: 'Mindfulness untuk Pemula', deskripsi: 'Pelajari dasar-dasar mindfulness untuk mengurangi kecemasan dan meningkatkan kesadaran diri sehari-hari.', durasi: 'Self-paced', level: 'Pemula', gambar: '', harga: 'Gratis'),
    CourseModel(judul: 'Meditasi Lanjutan: Yoga Nidra', deskripsi: 'Eksplorasi meditasi mendalam untuk relaksasi total dan pemulihan energi melalui teknik Yoga Nidra.', durasi: 'Self-paced', level: 'Lanjutan', gambar: '', harga: 'Gratis'),
    CourseModel(judul: 'Jurnal Harian untuk Kesehatan Mental', deskripsi: 'Panduan praktis menulis jurnal untuk memproses emosi dan mengenali pola pikir negatif.', durasi: 'Self-paced', level: 'Pemula', gambar: '', harga: 'Gratis'),
    CourseModel(judul: 'Membangun Ketahanan Emosional', deskripsi: 'Cara membangun resilience terhadap tantangan hidup dengan self-compassion dan strategi coping.', durasi: 'Self-paced', level: 'Menengah', gambar: '', harga: 'Gratis'),
    CourseModel(judul: 'Manajemen Stres di Tempat Kerja', deskripsi: 'Teknik efektif untuk mengelola tekanan kerja, termasuk time management dan relaksasi cepat.', durasi: 'Self-paced', level: 'Menengah', gambar: '', harga: 'Gratis'),
  ];

  final List<CourseModel> daftarRekomendasiCourses = [
    CourseModel(judul: 'Mindfulness untuk Pemula', deskripsi: 'Pelajari dasar-dasar mindfulness dan meditasi untuk mengurangi kecemasan sehari-hari. Kursus ini mencakup latihan pernapasan dan kesadaran diri.', durasi: '4 minggu (2 jam/minggu)', level: 'Pemula', gambar: 'assets/image/gambar11.jpg', harga: 'Gratis'),
    CourseModel(judul: 'Manajemen Stres di Tempat Kerja', deskripsi: 'Teknik praktis untuk mengelola tekanan kerja, termasuk time management dan relaksasi cepat. Cocok untuk profesional sibuk.', durasi: '6 sesi (1 jam/sesi)', level: 'Menengah', gambar: 'assets/image/gambar12.jpg', harga: 'Rp 75.000'),
    CourseModel(judul: 'Membangun Ketahanan Emosional', deskripsi: 'Cara membangun resilience terhadap tantangan hidup, dengan fokus pada self-compassion dan coping strategies.', durasi: '8 minggu (90 menit/minggu)', level: 'Menengah', gambar: 'assets/image/gambar13.jpg', harga: 'Rp 150.000'),
    CourseModel(judul: 'Jurnal Harian untuk Kesehatan Mental', deskripsi: 'Panduan menulis jurnal untuk memproses emosi, mengenali pola pikir negatif, dan meningkatkan mood.', durasi: '5 sesi (45 menit/sesi)', level: 'Pemula', gambar: 'assets/image/gambar14.jpg', harga: 'Rp 10.000'),
    CourseModel(judul: 'Meditasi Lanjutan: Yoga Nidra', deskripsi: 'Eksplorasi meditasi mendalam untuk relaksasi total dan pemulihan energi. Termasuk audio guided sessions.', durasi: '3 minggu (1,5 jam/minggu)', level: 'Lanjutan', gambar: 'assets/image/gambar15.jpg', harga: 'Rp 100.000'),
  ];

  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  late List<CourseModel> _filteredCourses;

  @override
  void initState() {
    super.initState();
    _filteredCourses = List.from(daftarCourses);
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      _searchQuery = _searchController.text.toLowerCase();
      _filteredCourses = daftarCourses.where((course) => course.judul.toLowerCase().contains(_searchQuery) || course.deskripsi.toLowerCase().contains(_searchQuery) || course.level.toLowerCase().contains(_searchQuery) || course.durasi.toLowerCase().contains(_searchQuery)).toList();
    });
  }

  void _clearSearch() {
    _searchController.clear();
    setState(() {
      _searchQuery = '';
      _filteredCourses = List.from(daftarCourses);
    });
  }

  void _logout() {
    widget.onLogout?.call();
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Logout berhasil!'), backgroundColor: Colors.orange));
  }

  Widget _buildImagePlaceholder(String? gambarPath) {
    if (gambarPath == null || gambarPath.isEmpty) {
      return Container(color: Colors.grey[300], child: const Icon(Icons.image_not_supported, color: Colors.grey));
    }
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
      child: Image.asset(gambarPath, width: double.infinity, fit: BoxFit.cover, errorBuilder: (context, error, stackTrace) => Container(color: Colors.grey[300], child: const Icon(Icons.error, color: Colors.red))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: LinearGradient(colors: [Color(0xFFB3E5FC), Color(0xFF2196F3)], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SafeArea(
          child: Column(children: [
            // Header
            Container(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12), width: double.infinity, child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const Text('CamHealth Dashboard', style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold)),
              IconButton(onPressed: _logout, icon: const Icon(Icons.logout, color: Colors.white, size: 28), tooltip: 'Logout'),
            ])),
            // Search Bar
            Container(padding: const EdgeInsets.symmetric(horizontal: 16.0), child: Card(color: Colors.white.withOpacity(0.9), child: TextField(controller: _searchController, decoration: InputDecoration(
              hintText: 'Cari course...',
              hintStyle: const TextStyle(color: Colors.grey),
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
              suffixIcon: _searchQuery.isNotEmpty ? IconButton(icon: const Icon(Icons.clear, color: Colors.grey), onPressed: _clearSearch) : null,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
              filled: true,
              fillColor: Colors.white.withOpacity(0.8),
              contentPadding: const EdgeInsets.symmetric(vertical: 12),
            ), onChanged: (value) => _onSearchChanged()))),
            // Section 1: Courses Terbaru
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(padding: const EdgeInsets.all(16.0), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text('Courses Terbaru', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
                if (_searchQuery.isNotEmpty) Text('${_filteredCourses.length} hasil', style: const TextStyle(fontSize: 14, color: Colors.white70)),
              ])),
              Expanded(child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: _filteredCourses.length,
                itemBuilder: (context, index) {
                  final course = _filteredCourses[index];
                  return Card(
                    color: Colors.white.withOpacity(0.9),
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                    child: ListTile(
                      title: Text(course.judul, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87)),
                      subtitle: Text(course.getDetailInfo(), style: const TextStyle(color: Colors.black54)),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Membuka course: ${course.judul} - ${course.getDetailInfo()}')));
                        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(judul: course.judul, deskripsi: course.deskripsi, gambarPath: course.gambar)));
                      },
                    ),
                  );
                },
              )),
            ])),
            // Section 2: Rekomendasi Courses
            Container(padding: const EdgeInsets.all(16.0), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('Rekomendasi Courses', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              SizedBox(height: 240, child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                itemCount: daftarRekomendasiCourses.length,
                itemBuilder: (context, index) {
                  final course = daftarRekomendasiCourses[index];
                  return Container(
                    width: 160,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    child: Card(
                      color: Colors.white.withOpacity(0.95),
                      elevation: 2,
                      child: InkWell(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Membuka course: ${course.judul} - ${course.getDetailInfo()}')));
                          Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(judul: course.judul, deskripsi: course.deskripsi, gambarPath: course.gambar)));
                        },
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Expanded(child: _buildImagePlaceholder(course.gambar)),
                          Padding(padding: const EdgeInsets.all(8.0), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Text(course.judul, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14), maxLines: 1, overflow: TextOverflow.ellipsis),
                            const SizedBox(height: 4),
                            Text(course.deskripsi, style: const TextStyle(fontSize: 12, color: Colors.black54), maxLines: 2, overflow: TextOverflow.ellipsis),
                            const SizedBox(height: 4),
                            Text(course.getDetailInfo(), style: const TextStyle(fontSize: 11, color: Colors.grey)),
                          ])),
                        ]),
                      ),
                    ),
                  );
                },
              )),
            ])),
          ]),
        ),
      ),
    );
  }
}