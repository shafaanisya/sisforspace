class ProgramKerja {
  int? id;
  String nama;
  String deskripsi;

  ProgramKerja({this.id, required this.nama, required this.deskripsi});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nama': nama,
      'kegiatan': deskripsi,
    };
  }

  static ProgramKerja fromMap(Map<String, dynamic> map) {
    return ProgramKerja(
      id: map['id'],
      nama: map['nama'],
      deskripsi: map['kegiatan'],
    );
  }
}
