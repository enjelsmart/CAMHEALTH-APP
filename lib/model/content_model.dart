abstract class ContentModel {
  final String _judul;
  final String _deskripsi;
  final String? _gambar;

  ContentModel({
    required String judul,
    required String deskripsi,
    String? gambar,
  }) : _judul = judul,
       _deskripsi = deskripsi,
       _gambar = gambar;

  String get judul => _judul;
  String get deskripsi => _deskripsi;
  String? get gambar => _gambar;

  String getDetailInfo();
}

class ArtikelModel extends ContentModel {
  ArtikelModel({required super.judul, required super.deskripsi, super.gambar});
   @override
  String getDetailInfo() => deskripsi.length > 50 ? '${deskripsi.substring(0, 50)}...' : deskripsi;
}

class CourseModel extends ContentModel {
  final String _durasi;
  final String _level;
  final String _harga;

  CourseModel({
    required String judul,
    required String deskripsi,
    required String durasi,
    required String level,
    String? gambar,
    required String harga,
  }) : _durasi = durasi,
       _level = level,
       _harga = harga,
       super(judul: judul, deskripsi: deskripsi, gambar: gambar);

  String get durasi => _durasi;
  String get level => _level;
  String get harga => _harga;

  @override
  String getDetailInfo() => 'Durasi: $durasi | Level: $level | Harga: $harga';
}
