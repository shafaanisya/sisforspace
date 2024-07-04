import 'package:flutter/material.dart';
import 'package:sisforspace/services/db_service.dart';
import 'package:sisforspace/models/absensi.dart';

class RekapAbsensiScreen extends StatefulWidget {
  @override
  _RekapAbsensiScreenState createState() => _RekapAbsensiScreenState();
}

class _RekapAbsensiScreenState extends State<RekapAbsensiScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rekap Absensi Rapat')),
      body: ListView.builder(
        itemCount: _absensiList.length,
        itemBuilder: (context, index) {
          final absensi = _absensiList[index];
          return ListTile(
            title: Text(absensi.anggota),
            subtitle: Text('Tanggal: ${absensi.tanggal}, Bulan: ${absensi.bulan}, Tahun: ${absensi.tahun}'),
          );
        },
      ),
    );
  }
}
