import 'package:flutter/material.dart';
import 'package:sisforspace/services/db_service.dart';
import 'package:sisforspace/models/program_kerja.dart';
import 'package:sisforspace/widgets/program_kerja_form.dart';

class ProgramKerjaScreen extends StatefulWidget {
  @override
  _ProgramKerjaScreenState createState() => _ProgramKerjaScreenState();
}

class _ProgramKerjaScreenState extends State<ProgramKerjaScreen> {
  final _dbService = DBService();
  List<ProgramKerja> _programKerjaList = [];

  @override
  void initState() {
    super.initState();
    _loadProgramKerja();
  }

  Future<void> _loadProgramKerja() async {
    final db = await _dbService.database;
    final result = await db.query('program_kerja');
    setState(() {
      _programKerjaList = result.map((e) => ProgramKerja.fromMap(e)).toList();
    });
  }

  void _openForm([ProgramKerja? programKerja]) {
    showDialog(
      context: context,
      builder: (_) => ProgramKerjaForm(programKerja: programKerja),
    ).then((_) => _loadProgramKerja());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Manajemen Program Kerja')),
      body: ListView.builder(
        itemCount: _programKerjaList.length,
        itemBuilder: (context, index) {
          final programKerja = _programKerjaList[index];
          return ListTile(
            title: Text(programKerja.nama),
            subtitle: Text(programKerja.deskripsi),
            onTap: () => _openForm(programKerja),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () async {
                final db = await _dbService.database;
                await db.delete('program_kerja', where: 'id = ?', whereArgs: [programKerja.id]);
                _loadProgramKerja();
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
