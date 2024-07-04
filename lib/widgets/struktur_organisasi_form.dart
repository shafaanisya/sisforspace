import 'package:flutter/material.dart';
import 'package:sisforspace/models/struktur_organisasi.dart';
import 'package:sisforspace/services/db_service.dart';

class StrukturOrganisasiForm extends StatefulWidget {
  final StrukturOrganisasi? struktur;

  StrukturOrganisasiForm({this.struktur});

  @override
  _StrukturOrganisasiFormState createState() => _StrukturOrganisasiFormState();
}

class _StrukturOrganisasiFormState extends State<StrukturOrganisasiForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _jabatanController = TextEditingController();
  final _periodeController = TextEditingController();
  final _dbService = DBService();

  @override
  void initState() {
    super.initState();
    if (widget.struktur != null) {
      _namaController.text = widget.struktur!.nama;
      _jabatanController.text = widget.struktur!.jabatan;
      _periodeController.text = widget.struktur!.periode;
    }
  }

  Future<void> _saveStruktur() async {
    if (_formKey.currentState!.validate()) {
      final struktur = StrukturOrganisasi(
        id: widget.struktur?.id,
        nama: _namaController.text,
        jabatan: _jabatanController.text,
        periode: _periodeController.text,
      );

      final db = await _dbService.database;
      if (struktur.id == null) {
        await db.insert('struktur_organisasi', struktur.toMap());
      } else {
        await db.update(
          'struktur_organisasi',
          struktur.toMap(),
          where: 'id = ?',
          whereArgs: [struktur.id],
        );
      }

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.struktur == null ? 'Tambah Struktur Organisasi' : 'Edit Struktur Organisasi'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _namaController,
              decoration: InputDecoration(labelText: 'Nama'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Nama tidak boleh kosong';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _jabatanController,
              decoration: InputDecoration(labelText: 'Jabatan'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Jabatan tidak boleh kosong';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _periodeController,
              decoration: InputDecoration(labelText: 'Periode'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Periode tidak boleh kosong';
                }
                return null;
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Batal'),
        ),
        ElevatedButton(
          onPressed: _saveStruktur,
          child: Text('Simpan'),
        ),
      ],
    );
  }
}
