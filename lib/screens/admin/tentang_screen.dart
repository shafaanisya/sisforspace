import 'package:flutter/material.dart';

class TentangScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tentang')),
      body: ListView(
        children: [
          ListTile(
            title: Text('Prodi SI'),
            onTap: () {
              // Implementasi navigasi atau konten
            },
          ),
          ListTile(
            title: Text('SisforSpace'),
            onTap: () {
              // Implementasi navigasi atau konten
            },
          ),
        ],
      ),
    );
  }
}
