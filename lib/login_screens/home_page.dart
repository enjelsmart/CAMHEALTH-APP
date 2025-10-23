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

Mulai hari dengan meditasi
Olahraga ringan secara teratur
Istirahat cukup dan tidur berkualitas
Luangkan waktu untuk diri sendiri
Atur prioritas dan kelola waktu dengan baik
BENEFIT DARI COURSE INI:
✨ 1. Akses Seumur Hidup ke Materi Course
Nikmati seluruh video dan panduan meditasi kapan pun tanpa batas waktu. Kamu bisa mengulang sesi meditasi sesuai kebutuhanmu.
🎧 2. Bonus Musik Relaksasi Eksklusif
Dapatkan paket musik relaksasi premium yang dapat kamu gunakan untuk menemani sesi meditasi harianmu secara gratis.

📜 3. E-Sertifikat Penyelesaian Course
Setelah menyelesaikan seluruh modul, kamu akan menerima e-sertifikat resmi sebagai bukti bahwa kamu telah memahami dasar-dasar meditasi dan manajemen stres.

🧘 4. Panduan Praktik Meditasi Harian (PDF Download)
Dapatkan panduan harian berisi langkah-langkah singkat untuk membantumu membangun kebiasaan meditasi secara konsisten.

💬 5. Akses ke Komunitas Belajar Mindfulness
Bergabunglah dengan komunitas peserta lain untuk berbagi pengalaman, tips, dan motivasi seputar meditasi dan kesehatan mental.

📱 6. Akses di Semua Perangkat
Belajar dengan nyaman di mana saja — melalui smartphone, tablet, maupun laptop.
''',
      durasi: 'Self-paced',
      level: 'Pemula',
      gambar: 'assets/image/gambar11.jpg',
      harga: '45.000',
    ),
    CourseModel(
      judul: 'Panduan Meditasi untuk Pemula',
      deskripsi: 'Instruksi langkah demi langkah meditasi mindfulness untuk keseharian.',
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
      deskripsi: 'Cara menulis jurnal dapat membantu memahami dan mengelola perasaan.',
      durasi: 'Self-paced',
      level: 'Pemula',
      gambar: 'assets/image/gambar14.jpg',
      harga: '100.000',
    ),
    CourseModel(
      judul: 'Mindfulness untuk Pemula',
      deskripsi: 'Pelajari dasar-dasar mindfulness untuk mengurangi kecemasan dan meningkatkan kesadaran diri sehari-hari.',
      durasi: 'Self-paced',
      level: 'Pemula',
      gambar: 'assets/image/gambar15.jpg',
      harga: '55.000',
    ),
    CourseModel(
      judul: 'Meditasi Lanjutan: Yoga Nidra',
      deskripsi: 'Eksplorasi meditasi mendalam untuk relaksasi total dan pemulihan energi melalui teknik Yoga Nidra.',
      durasi: 'Self-paced',
      level: 'Lanjutan',
      gambar: 'assets/image/gambar16.jpg',
      harga: '450.000',
    ),
    CourseModel(
      judul: 'Jurnal Harian untuk Kesehatan Mental',
      deskripsi: 'Panduan praktis menulis jurnal untuk memproses emosi dan mengenali pola pikir negatif.',
      durasi: 'Self-paced',
      level: 'Pemula',
      gambar: 'assets/image/gambar14.jpg',
      harga: '125.000',
    ),
    CourseModel(
      judul: 'Membangun Ketahanan Emosional',
      deskripsi: 'Cara membangun resilience terhadap tantangan hidup dengan self-compassion dan strategi coping.',
      durasi: 'Self-paced',
      level: 'Menengah',
      gambar: 'assets/image/gambar12.jpg',
      harga: '200.000',
    ),
    CourseModel(
      judul: 'Manajemen Stres di Tempat Kerja',
      deskripsi: 'Teknik efektif untuk mengelola tekanan kerja, termasuk time management dan relaksasi cepat.',
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

Kursus akan mengajarkan berbagai hal mendasar seperti apa itu self-hypnosis, rahasia di balik cara berpikir manusia, kekuatan doa, langkah-langkah self-hypnosis, relaksasi dan pikiran bawah sadar, membuat induksi, hingga praktik self-hypnosis itu sendiri.

Kursus ini dirancang oleh Dwi Sutarjantono, seorang mind programmer berpengalaman yang menguasai keahlian hipnoterapis, dan master dari NLP. Dwi sendiri telah mendirikan lembaga Mindpower Indonesia serta Hypnocreatives Indonesia.

Dwi telah melakukan berbagai pelatihan dengan berbagai tema seperti Bertahan di Kala Pandemi, Empowerment Through Mind, Hypnowriting for Sales, dan Hypnoparenting.

Dwi Sutarjantono meyakini bahwa dalam pikiran manusia terdapat berbagai kekuatan yang bermanfaat. Seperti menjadi sarana relaksasi, penguat imun, serta mampu membantu penyembuhan psikosomatis.
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
      deskripsi: 'Pelajari dasar-dasar mindfulness dan meditasi untuk mengurangi kecemasan sehari-hari. Kursus ini mencakup latihan pernapasan dan kesadaran diri.',
      durasi: '4 minggu (2 jam/minggu)',
      level: 'Pemula',
      gambar: 'assets/image/gambar11.jpg',
      harga: '45.000',
    ),
    CourseModel(
      judul: 'Manajemen Stres di Tempat Kerja',
      deskripsi: 'Teknik praktis untuk mengelola tekanan kerja, termasuk time management dan relaksasi cepat. Cocok untuk profesional sibuk.',
      durasi: '6 sesi (1 jam/sesi)',
      level: 'Menengah',
      gambar: 'assets/image/gambar12.jpg',
      harga: '75.000',
    ),
    CourseModel(
      judul: 'Membangun Ketahanan Emosional',
      deskripsi: 'Cara membangun resilience terhadap tantangan hidup, dengan fokus pada self-compassion dan coping strategies.',
      durasi: '8 minggu (90 menit/minggu)',
      level: 'Menengah',
      gambar: 'assets/image/gambar13.jpg',
      harga: '150.000',
    ),
    CourseModel(
      judul: 'Jurnal Harian untuk Kesehatan Mental',
      deskripsi: 'Panduan menulis jurnal untuk memproses emosi, mengenali pola pikir negatif, dan meningkatkan mood.',
      durasi: '5 sesi (45 menit/sesi)',
      level: 'Pemula',
      gambar: 'assets/image/gambar14.jpg',
      harga: '10.000',
    ),
    CourseModel(
      judul: 'Meditasi Lanjutan: Yoga Nidra',
      deskripsi: 'Eksplorasi meditasi mendalam untuk relaksasi total dan pemulihan energi. Termasuk audio guided sessions.',
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

  Widget _buildImage(String? gambarPath, double width, double height, {BoxFit fit = BoxFit.cover}) {
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
              // Header
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'CamHealth Dashboard',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Consumer<CartProvider>(
                          builder: (context, cart, child) {
                            final count = cart.itemCount;
                            return Stack(
                              clipBehavior: Clip.none,
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.shopping_cart,
                                    color: Colors.amber,
                                    size: 28,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const CartPage(),
                                      ),
                                    );
                                  },
                                  tooltip: 'Keranjang',
                                ),
                                if (count > 0)
                                  Positioned(
                                    right: 0,
                                    top: -2,
                                    child: Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 1,
                                        ),
                                      ),
                                      constraints: const BoxConstraints(
                                        minWidth: 18,
                                        minHeight: 16,
                                      ),
                                      child: Text(
                                        '$count',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                              ],
                            );
                          },
                        ),
                        const SizedBox(width: 6),
                        IconButton(
                          onPressed: _logout,
                          icon: const Icon(
                            Icons.logout,
                            color: Colors.white,
                            size: 28,
                          ),
                          tooltip: 'Logout',
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Search Bar
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Card(
                  color: const Color.fromRGBO(255, 255, 255, 0.9),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Cari course...',
                      hintStyle: const TextStyle(color: Colors.grey),
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
                      contentPadding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    onChanged: (value) => _onSearchChanged(),
                  ),
                ),
              ),

               // Content List
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
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
                    ),
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: _filteredCourses.length,
                        itemBuilder: (context, index) {
                          final course = _filteredCourses[index];
                          return Card(
                            color: const Color.fromRGBO(255, 255, 255, 0.95),
                            elevation: 2,
                            margin: const EdgeInsets.symmetric(
                              vertical: 6,
                              horizontal: 6,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(8),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailPage(course: course),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                   
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: SizedBox(
                                        width: MediaQuery.of(context).size.width * 0.20, 
                                        height: 70,
                                        child: _buildImage(
                                          course.gambar,
                                          double.infinity,
                                          double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 11),
                                  
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            course.judul,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black87,
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            softWrap: true, 
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            course.deskripsi,
                                            style: const TextStyle(
                                              color: Colors.black54,
                                            ),
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                            softWrap: true, 
                                          ),
                                          const SizedBox(height: 7),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded( 
                                                child: Text(
                                                  'Rp ${course.harga}',
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                  overflow: TextOverflow.ellipsis,
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
                                                  ScaffoldMessenger.of(context).showSnackBar(
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
                    ),
                  ],
                ),
              ),

                     // Rekomendasi Horizontal 
              Container(
                padding: const EdgeInsets.all(14.0),
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.2, 
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Rekomendasi Courses',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Expanded( 
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        itemCount: daftarRekomendasiCourses.length,
                        itemBuilder: (context, index) {
                          final course = daftarRekomendasiCourses[index];
                          return Container(
                            width: MediaQuery.of(context).size.width * 0.4, 
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            child: Card(
                              color: const Color.fromRGBO(255, 255, 255, 0.95),
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(12),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailPage(course: course),
                                    ),
                                  );
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                 
                                    AspectRatio(
                                      aspectRatio: 16 / 9, 
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.vertical(
                                          top: Radius.circular(12),
                                        ),
                                        child: _buildImage(
                                          course.gambar,
                                          double.infinity,
                                          double.infinity,
                                          fit: BoxFit.cover, 
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            course.judul,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            softWrap: true,
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            course.getDetailInfo(),
                                            style: const TextStyle(
                                              fontSize: 11,
                                              color: Colors.grey,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            softWrap: true,
                                          ),
                                          const SizedBox(height: 6),
                                          Text(
                                            'Rp ${course.harga}',
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
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
            ],
          ),
        ),
      ),
    );
  }
}