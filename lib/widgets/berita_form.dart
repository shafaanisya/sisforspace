import 'package:flutter/material.dart';
import 'package:sisforspace/models/berita.dart';
import 'package:sisforspace/services/db_service.dart';

class BeritaForm extends StatefulWidget {
  final Berita? berita;

  BeritaForm({this.berita});

  @override
  _BeritaFormState createState() => _BeritaFormState();
}

class _BeritaFormState extends State<BeritaForm> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final _dbService = DBService();

  @override
  void initState() {
    super.initState();
    if (widget.berita != null) {
      _titleController.text = widget.berita!.title;
      _contentController.text = widget.berita!.content;
    }
  }

  Future<void> _saveBerita() async {
    if (_formKey.currentState!.validate()) {
      final berita = Berita(
        id: widget.berita?.id,
        title: _titleController.text,
        content: _contentController.text,
      );

      final db = await _dbService.database;
      if (berita.id == null) {
        await db.insert('berita', berita.toMap());
      } else {
        await db.update(
          'berita',
          berita.toMap(),
          where: 'id = ?',
          whereArgs: [berita.id],
        );
      }

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.berita == null ? 'Tambah Berita' : 'Edit Berita'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Judul'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Judul tidak boleh kosong';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _contentController,
              decoration: InputDecoration(labelText: 'Konten'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Konten tidak boleh kosong';
                }
                return null;
              },
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Batal'),
        ),
        ElevatedButton(
          onPressed: _saveBerita,
          child: Text('Simpan'),
        ),
      ],
    );
  }
}
