import 'package:flutter/material.dart';
import 'package:sisforspace/models/program_kerja.dart';
import 'package:sisforspace/services/db_service.dart';

class ProgramKerjaForm extends StatefulWidget {
  final ProgramKerja? programKerja;

  ProgramKerjaForm({this.programKerja});

  @override
  _ProgramKerjaFormState createState() => _ProgramKerjaFormState();
}

class _ProgramKerjaFormState extends State<ProgramKerjaForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _deskripsiController = TextEditingController();
  final _dbService = DBService();

  @override
  void initState() {
    super.initState();
    if (widget.programKerja != null) {
      _namaController.text = widget.programKerja!.nama;
      _deskripsiController.text = widget.programKerja!.deskripsi;
    }
  }

  Future<void> _saveProgramKerja() async {
    if (_formKey.currentState!.validate()) {
      final programKerja = ProgramKerja(
        id: widget.programKerja?.id,
        nama: _namaController.text,
        deskripsi: _deskripsiController.text,
      );

      final db = await _dbService.database;
      if (programKerja.id == null) {
        await db.insert('program_kerja', programKerja.toMap());
      } else {
        await db.update(
          'program_kerja',
          programKerja.toMap(),
          where: 'id = ?',
          whereArgs: [programKerja.id],
        );
      }

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.programKerja == null ? 'Tambah Program Kerja' : 'Edit Program Kerja'),
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
              controller: _deskripsiController,
              decoration: InputDecoration(labelText: 'Deskripsi'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Deskripsi tidak boleh kosong';
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
          onPressed: _saveProgramKerja,
          child: Text('Simpan'),
        ),
      ],
    );
  }
}
