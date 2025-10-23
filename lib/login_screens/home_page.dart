import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:new_flutter/detail_screens/detail_page.dart';
import '../model/content_model.dart';
import '../providers/cart_provider.dart';
import '../providers/cart_page.dart';

class HomePage extends StatefulWidget {
  final VoidCallback? onLogout;

  const HomePage({super.key, this.onLogout});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<CourseModel> daftarCourses = [
    CourseModel(
      judul: '5 Cara Efektif Mengurangi Stres',
      deskripsi: '''
Pelajari teknik relaksasi dan manajemen stres yang mudah dilakukan.
BENEFIT DARI COURSE INI:
✨ 1. Akses Seumur Hidup ke Materi Course
Nikmati seluruh video dan panduan meditasi kapan pun tanpa batas waktu. Kamu bisa mengulang sesi meditasi sesuai kebutuhanmu.
🎧 2. Bonus Musik Relaksasi Eksklusif
Dapatkan paket musik relaksasi premium yang dapat kamu gunakan untuk menemani sesi meditasi harianmu secara gratis.
📜 3. E-Sertifikat Penyelesaian Course
Setelah menyelesaikan seluruh modul, kamu akan menerima e-sertifikat resmi sebagai bukti bahwa kamu telah memahami dasar-dasar meditasi dan manajemen stres.

''',
      durasi: 'Self-paced',
      level: 'Pemula',
      gambar: 'assets/image/gambar11.jpg',
      harga: '45.000',
    ),
    CourseModel(
      judul: 'Panduan Meditasi untuk Pemula',
      deskripsi:
         '''Instruksi langkah demi langkah meditasi mindfulness untuk keseharian.
         ✨ 1. Akses Seumur Hidup ke Materi Course
Nikmati seluruh video dan panduan meditasi kapan pun tanpa batas waktu. Kamu bisa mengulang sesi meditasi sesuai kebutuhanmu.
🎧 2. Bonus Musik Relaksasi Eksklusif
Dapatkan paket musik relaksasi premium yang dapat kamu gunakan untuk menemani sesi meditasi harianmu secara gratis.
📜 3. E-Sertifikat Penyelesaian Course
Setelah menyelesaikan seluruh modul, kamu akan menerima e-sertifikat resmi sebagai bukti bahwa kamu telah memahami dasar-dasar meditasi dan manajemen stres.
''',
      durasi: 'Self-paced',
      level: 'Pemula',
      gambar: 'assets/image/gambar12.jpg',
      harga: '50.000',
    ),
    CourseModel(
      judul: 'Menjaga Kesehatan Mental di Tempat Kerja',
      deskripsi: 'Tips menjaga fokus dan mengurangi tekanan kerja.',
      durasi: 'Self-paced',
      level: 'Pemula',
      gambar: 'assets/image/gambar13.jpg',
      harga: '180.000',
    ),
    CourseModel(
      judul: 'Manfaat Jurnal Harian bagi Emosi',
      deskripsi:
          'Cara menulis jurnal dapat membantu memahami dan mengelola perasaan.',
      durasi: 'Self-paced',
      level: 'Pemula',
      gambar: 'assets/image/gambar14.jpg',
      harga: '100.000',
    ),
    CourseModel(
      judul: 'Mindfulness untuk Pemula',
      deskripsi:
          'Pelajari dasar-dasar mindfulness untuk mengurangi kecemasan dan meningkatkan kesadaran diri sehari-hari.',
      durasi: 'Self-paced',
      level: 'Pemula',
      gambar: 'assets/image/gambar15.jpg',
      harga: '55.000',
    ),
    CourseModel(
      judul: 'Meditasi Lanjutan: Yoga Nidra',
      deskripsi:
          'Eksplorasi meditasi mendalam untuk relaksasi total dan pemulihan energi melalui teknik Yoga Nidra.',
      durasi: 'Self-paced',
      level: 'Lanjutan',
      gambar: 'assets/image/gambar16.jpg',
      harga: '450.000',
    ),
    CourseModel(
      judul: 'Jurnal Harian untuk Kesehatan Mental',
      deskripsi:
          'Panduan praktis menulis jurnal untuk memproses emosi dan mengenali pola pikir negatif.',
      durasi: 'Self-paced',
      level: 'Pemula',
      gambar: 'assets/image/gambar14.jpg',
      harga: '125.000',
    ),
    CourseModel(
      judul: 'Membangun Ketahanan Emosional',
      deskripsi:
          'Cara membangun resilience terhadap tantangan hidup dengan self-compassion dan strategi coping.',
      durasi: 'Self-paced',
      level: 'Menengah',
      gambar: 'assets/image/gambar12.jpg',
      harga: '200.000',
    ),
    CourseModel(
      judul: 'Manajemen Stres di Tempat Kerja',
      deskripsi:
          'Teknik efektif untuk mengelola tekanan kerja, termasuk time management dan relaksasi cepat.',
      durasi: 'Self-paced',
      level: 'Menengah',
      gambar: 'assets/image/gambar14.jpg',
      harga: '320.000',
    ),
    CourseModel(
      judul: 'Menjadi Praktisi Self Hypnosis: Sembuhkan Diri Sendiri',
      deskripsi: '''
Berbagai masalah hidup, mulai dari masalah psikis, gelisah, stres, burnout, hingga berbagai masalah fisik, kerap menerpa kita. Hal ini tentu saja menjadi pengalaman hidup yang tidak menyenangkan untuk dijalani. Apalagi dengan kondisi dan situasi pandemi saat ini, dimana perubahan dan ketidakpastian kerap terjadi dengan begitu cepat, sehingga membuat keadaan kerap tidak menguntungkan bagi kita dan meniadakan pikiran positif.

Temukan cara baru untuk mengatasi dan menyembuhkan diri Anda dari berbagai tantangan hidup dengan belajar tentang hypnosis, terutama self-hypnosis. Kuasai hipnosis diri untuk dapat menggali kekuatan pikiran bawah sadar Anda, sehingga menjadi kekuatan untuk keluar dari berbagai persoalan hidup yang menerpa.

Kursus akan mengajarkan berbagai hal mendasar seperti apa itu self-hypnosis, Dan Bagaimana Langkah langkah nya?
''',
      durasi: 'Self-paced',
      level: 'Lanjutan',
      gambar: 'assets/image/gambar9.jpeg',
      harga: '600.000',
    ),
  ];

  final List<CourseModel> daftarRekomendasiCourses = [
    CourseModel(
      judul: 'Mindfulness untuk Pemula',
      deskripsi:
          'Pelajari dasar-dasar mindfulness dan meditasi untuk mengurangi kecemasan sehari-hari. Kursus ini mencakup latihan pernapasan dan kesadaran diri.',
      durasi: '4 minggu (2 jam/minggu)',
      level: 'Pemula',
      gambar: 'assets/image/gambar11.jpg',
      harga: '45.000',
    ),
    CourseModel(
      judul: 'Manajemen Stres di Tempat Kerja',
      deskripsi:
          'Teknik praktis untuk mengelola tekanan kerja, termasuk time management dan relaksasi cepat. Cocok untuk profesional sibuk.',
      durasi: '6 sesi (1 jam/sesi)',
      level: 'Menengah',
      gambar: 'assets/image/gambar12.jpg',
      harga: '75.000',
    ),
    CourseModel(
      judul: 'Membangun Ketahanan Emosional',
      deskripsi:
          'Cara membangun resilience terhadap tantangan hidup, dengan fokus pada self-compassion dan coping strategies.',
      durasi: '8 minggu (90 menit/minggu)',
      level: 'Menengah',
      gambar: 'assets/image/gambar13.jpg',
      harga: '150.000',
    ),
    CourseModel(
      judul: 'Jurnal Harian untuk Kesehatan Mental',
      deskripsi:
          'Panduan menulis jurnal untuk memproses emosi, mengenali pola pikir negatif, dan meningkatkan mood.',
      durasi: '5 sesi (45 menit/sesi)',
      level: 'Pemula',
      gambar: 'assets/image/gambar14.jpg',
      harga: '10.000',
    ),
    CourseModel(
      judul: 'Meditasi Lanjutan: Yoga Nidra',
      deskripsi:
          'Eksplorasi meditasi mendalam untuk relaksasi total dan pemulihan energi. Termasuk audio guided sessions.',
      durasi: '3 minggu (1,5 jam/minggu)',
      level: 'Lanjutan',
      gambar: 'assets/image/gambar15.jpg',
      harga: '100.000',
    ),
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
      _filteredCourses = daftarCourses.where((course) {
        final q = _searchQuery;
        return course.judul.toLowerCase().contains(q) ||
            course.deskripsi.toLowerCase().contains(q) ||
            course.level.toLowerCase().contains(q) ||
            course.durasi.toLowerCase().contains(q);
      }).toList();
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
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Logout berhasil!'),
        backgroundColor: Colors.orange,
      ),
    );
  }

  Widget _buildImage(
    String? gambarPath,
    double width,
    double height, {
    BoxFit fit = BoxFit.cover,
  }) {
    if (gambarPath == null || gambarPath.isEmpty) {
      return Container(
        width: width,
        height: height,
        color: Colors.grey[300],
        child: const Icon(Icons.image_not_supported, color: Colors.grey),
      );
    }
    return Image.asset(
      gambarPath,
      width: width,
      height: height,
      fit: fit,
      errorBuilder: (context, error, stackTrace) => Container(
        width: width,
        height: height,
        color: Colors.grey[300],
        child: const Icon(Icons.error, color: Colors.red),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFB3E5FC), Color(0xFF2196F3)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 10,
                ),
                child: Card(
                  color: const Color.fromRGBO(255, 255, 255, 0.9),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Cari course...',
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      suffixIcon: _searchQuery.isNotEmpty
                          ? IconButton(
                              icon: const Icon(Icons.clear, color: Colors.grey),
                              onPressed: _clearSearch,
                            )
                          : null,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: const Color.fromRGBO(255, 255, 255, 0.8),
                    ),
                  ),
                ),
              ),

  
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Courses Terbaru',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            if (_searchQuery.isNotEmpty)
                              Text(
                                '${_filteredCourses.length} hasil',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.white70,
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 8),

                        // 🔹 Daftar Courses
                        ListView.builder(
                          padding: const EdgeInsets.only(bottom: 16),
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: _filteredCourses.length,
                          itemBuilder: (context, index) {
                            final course = _filteredCourses[index];
                            return Card(
                              color: const Color.fromRGBO(255, 255, 255, 0.95),
                              elevation: 2,
                              margin: const EdgeInsets.symmetric(vertical: 6),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(8),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          DetailPage(course: course),
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // 🔸 Gambar
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: _buildImage(
                                          course.gambar,
                                          90,
                                          90,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(width: 10),

                                      // 🔸 Teks
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              course.judul,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black87,
                                                fontSize: 15,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              course.deskripsi,
                                              style: const TextStyle(
                                                color: Colors.black54,
                                                fontSize: 13,
                                              ),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            const SizedBox(height: 6),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    'Rp ${course.harga}',
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black87,
                                                    ),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                IconButton(
                                                  icon: const Icon(
                                                    Icons.add_shopping_cart,
                                                    color: Colors.amber,
                                                  ),
                                                  onPressed: () {
                                                    Provider.of<CartProvider>(
                                                      context,
                                                      listen: false,
                                                    ).addCourse(course);
                                                    ScaffoldMessenger.of(
                                                      context,
                                                    ).showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Ditambahkan: ${course.judul}',
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),

                        // 🔹 Rekomendasi Courses (Horizontal)
                        const Text(
                          'Rekomendasi Courses',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          height: 190,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: daftarRekomendasiCourses.length,
                            itemBuilder: (context, index) {
                              final course = daftarRekomendasiCourses[index];
                              return Container(
                                width: 180,
                                margin: const EdgeInsets.only(right: 10),
                                child: Card(
                                  color: const Color.fromRGBO(
                                    255,
                                    255,
                                    255,
                                    0.95,
                                  ),
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              DetailPage(course: course),
                                        ),
                                      );
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              const BorderRadius.vertical(
                                                top: Radius.circular(12),
                                              ),
                                          child: _buildImage(
                                            course.gambar,
                                            double.infinity,
                                            90,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                course.judul,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13,
                                                  color: Colors.black87,
                                                ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              const SizedBox(height: 4),
                                              Text(
                                                course.getDetailInfo(),
                                                style: const TextStyle(
                                                  fontSize: 11,
                                                  color: Colors.black54,
                                                ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              const SizedBox(height: 6),
                                              Text(
                                                'Rp ${course.harga}',
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black87,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
