import 'package:flutter/material.dart';

class GaleriKegiatanScreen extends StatefulWidget {
  @override
  _GaleriKegiatanScreenState createState() => _GaleriKegiatanScreenState();
}

class _GaleriKegiatanScreenState extends State<GaleriKegiatanScreen> {
  final List<String> _galeriList = ['Kegiatan 1', 'Kegiatan 2', 'Kegiatan 3'];

  void _addKegiatan() {
    setState(() {
      _galeriList.add('Kegiatan ${_galeriList.length + 1}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Manajemen Galeri Kegiatan')),
      body: ListView.builder(
        itemCount: _galeriList.length,
        itemBuilder: (context, index) {
          final kegiatan = _galeriList[index];
          return ListTile(
            title: Text(kegiatan),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addKegiatan,
        child: Icon(Icons.add),
      ),
    );
  }
}
