import 'package:flutter/material.dart';
import 'berita_screen.dart';
import 'tentang_screen.dart';
import 'program_kerja_screen.dart';
import 'galeri_kegiatan_screen.dart';
import 'struktur_organisasi_screen.dart';

class AdminHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Admin Home')),
      body: ListView(
        children: [
          ListTile(
            title: Text('Manajemen Berita'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BeritaScreen()),
            ),
          ),
          ListTile(
            title: Text('Manajemen Tentang'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TentangScreen()),
            ),
          ),
          ListTile(
            title: Text('Manajemen Program Kerja'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProgramKerjaScreen()),
            ),
          ),
          ListTile(
            title: Text('Manajemen Galeri Kegiatan'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GaleriKegiatanScreen()),
            ),
          ),
          ListTile(
            title: Text('Manajemen Struktur Organisasi'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => StrukturOrganisasiScreen()),
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class AdminHomeScreen extends StatelessWidget {
//   const AdminHomeScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Admin Home')),
//       body: ListView(
//         children: [
//           ListTile(
//             title: const Text('Manajemen Berita'),
//             onTap: () {
//               Navigator.pushNamed(context, '/berita');
//             },
//           ),
//           ListTile(
//             title: const Text('Manajemen Program Kerja'),
//             onTap: () {
//               Navigator.pushNamed(context, '/program_kerja');
//             },
//           ),
//           ListTile(
//             title: const Text('Manajemen Struktur Organisasi'),
//             onTap: () {
//               Navigator.pushNamed(context, '/struktur_organisasi');
//             },
//           ),
//           ListTile(
//             title: const Text('Tentang'),
//             onTap: () {
//               Navigator.pushNamed(context, '/tentang');
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
