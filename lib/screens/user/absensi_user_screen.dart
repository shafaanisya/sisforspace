import 'package:flutter/material.dart';
import 'package:sisforspace/services/db_service.dart';
import 'package:sisforspace/models/absensi.dart';

class AbsensiUserScreen extends StatefulWidget {
  @override
  _AbsensiUserScreenState createState() => _AbsensiUserScreenState();
}

class _AbsensiUserScreenState extends State<AbsensiUserScreen> {
  final _dbService = DBService();
  final _nameController = TextEditingController();

  Future<void> _absen() async {
    if (_nameController.text.isNotEmpty) {
      final absensi = Absensi(
        anggota: _nameController.text,
        tanggal: DateTime.now().toString(),
        bulan: DateTime.now().month.toString(),
        tahun: DateTime.now().year.toString(),
      );

      final db = await _dbService.database;
      await db.insert('absensi', absensi.toMap());
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Absensi Rapat')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nama'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _absen,
              child: Text('Absen'),
            ),
          ],
        ),
      ),
    );
  }
}
