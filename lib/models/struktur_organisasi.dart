class StrukturOrganisasi {
  int? id;
  String nama;
  String jabatan;
  String periode;

  StrukturOrganisasi(
      {this.id,
      required this.nama,
      required this.jabatan,
      required this.periode});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nama': nama,
      'jabatan': jabatan,
      'periode': periode,
    };
  }

  static StrukturOrganisasi fromMap(Map<String, dynamic> map) {
    return StrukturOrganisasi(
      id: map['id'],
      nama: map['nama'],
      jabatan: map['jabatan'],
      periode: map['periode'],
    );
  }
}
