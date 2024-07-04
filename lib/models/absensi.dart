class Absensi {
  final int? id;
  final String anggota;
  final String tanggal;
  final String bulan;
  final String tahun;

  Absensi({
    this.id,
    required this.anggota,
    required this.tanggal,
    required this.bulan,
    required this.tahun,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'anggota': anggota,
      'tanggal': tanggal,
      'bulan': bulan,
      'tahun': tahun,
    };
  }

  static Absensi fromMap(Map<String, dynamic> map) {
    return Absensi(
      id: map['id'],
      anggota: map['anggota'],
      tanggal: map['tanggal'],
      bulan: map['bulan'],
      tahun: map['tahun'],
    );
  }
}
