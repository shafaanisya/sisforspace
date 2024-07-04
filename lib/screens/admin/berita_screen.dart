import 'package:flutter/material.dart';
import 'package:sisforspace/models/berita.dart';
import 'package:sisforspace/services/db_service.dart';
import 'package:sisforspace/widgets/berita_form.dart';

class BeritaScreen extends StatefulWidget {
  @override
  _BeritaScreenState createState() => _BeritaScreenState();
}

class _BeritaScreenState extends State<BeritaScreen> {
  final _dbService = DBService();
  List<Berita> _beritaList = [];

  @override
  void initState() {
    super.initState();
    _loadBerita();
  }

  Future<void> _loadBerita() async {
    final db = await _dbService.database;
    final result = await db.query('berita');
    setState(() {
      _beritaList = result.map((e) => Berita.fromMap(e)).toList();
    });
  }

  void _openForm([Berita? berita]) {
    showDialog(
      context: context,
      builder: (_) => BeritaForm(berita: berita),
    ).then((_) => _loadBerita());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Manajemen Berita')),
      body: ListView.builder(
        itemCount: _beritaList.length,
        itemBuilder: (context, index) {
          final berita = _beritaList[index];
          return ListTile(
            title: Text(berita.title),
            subtitle: Text(berita.content),
            onTap: () => _openForm(berita),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () async {
                final db = await _dbService.database;
                await db.delete('berita', where: 'id = ?', whereArgs: [berita.id]);
                _loadBerita();
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
