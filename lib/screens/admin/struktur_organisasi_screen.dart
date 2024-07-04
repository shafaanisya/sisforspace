import 'package:flutter/material.dart';
import 'package:sisforspace/services/db_service.dart';
import 'package:sisforspace/models/struktur_organisasi.dart';
import 'package:sisforspace/widgets/struktur_organisasi_form.dart';

class StrukturOrganisasiScreen extends StatefulWidget {
  @override
  _StrukturOrganisasiScreenState createState() => _StrukturOrganisasiScreenState();
}

class _StrukturOrganisasiScreenState extends State<StrukturOrganisasiScreen> {
  final _dbService = DBService();
  List<StrukturOrganisasi> _strukturList = [];

  @override
  void initState() {
    super.initState();
    _loadStruktur();
  }

  Future<void> _loadStruktur() async {
    final db = await _dbService.database;
    final result = await db.query('struktur_organisasi');
    setState(() {
      _strukturList = result.map((e) => StrukturOrganisasi.fromMap(e)).toList();
    });
  }

  void _openForm([StrukturOrganisasi? struktur]) {
    showDialog(
      context: context,
      builder: (_) => StrukturOrganisasiForm(struktur: struktur),
    ).then((_) => _loadStruktur());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Manajemen Struktur Organisasi')),
      body: ListView.builder(
        itemCount: _strukturList.length,
        itemBuilder: (context, index) {
          final struktur = _strukturList[index];
          return ListTile(
            title: Text(struktur.nama),
            subtitle: Text(struktur.jabatan),
            onTap: () => _openForm(struktur),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () async {
                final db = await _dbService.database;
                await db.delete('struktur_organisasi', where: 'id = ?', whereArgs: [struktur.id]);
                _loadStruktur();
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openForm(),
        child: Icon(Icons.add),
      ),
    );
  }
}
