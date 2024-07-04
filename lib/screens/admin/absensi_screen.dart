import 'package:flutter/material.dart';
import 'package:sisforspace/models/absensi.dart';
import 'package:sisforspace/services/db_service.dart';

class AbsensiScreen extends StatefulWidget {
  @override
  _AbsensiScreenState createState() => _AbsensiScreenState();
}

class _AbsensiScreenState extends State<AbsensiScreen> {
  final _dbService = DBService();
  List<Absensi> _absensiList = [];

  @override
  void initState() {
    super.initState();
    _loadAbsensi();
  }

  Future<void> _loadAbsensi() async {
    final db = await _dbService.database;
    final result = await db.query('absensi');
    setState(() {
      _absensiList = result.map((e) => Absensi.fromMap(e)).toList();
    });
  }

  void _addAbsensi() async {
    final db = await _dbService.database;
    final absensi = Absensi(anggota: 'Anggota 1', tanggal: '14', bulan: '06', tahun: '2024');
    await db.insert('absensi', absensi.toMap());
    _loadAbsensi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Manajemen Absensi')),
      body: ListView.builder(
        itemCount: _absensiList.length,
        itemBuilder: (context, index) {
          final absensi = _absensiList[index];
          return ListTile(
            title: Text(absensi.anggota),
            subtitle: Text('${absensi.tanggal}/${absensi.bulan}/${absensi.tahun}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addAbsensi,
        child: Icon(Icons.add),
      ),
    );
  }
}
