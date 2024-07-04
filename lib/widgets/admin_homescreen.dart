import 'package:flutter/material.dart';
import '../screens/admin/beranda.dart';
import '../screens/admin/berita_screen.dart';
import '../screens/admin/tentang_screen.dart';
import '../screens/admin/program_kerja_screen.dart';
import '../screens/admin/galeri_kegiatan_screen.dart';
import '../screens/admin/struktur_organisasi_screen.dart';
import '../screens/logout_screen.dart';

class AdminHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Admin Home')),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Beranda"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Beranda()));
            },
          ),
          ListTile(
            leading: Icon(Icons.accessible),
            title: Text("Manajemen Berita"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BeritaScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text("Manajemen Tentang"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TentangScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.account_box_sharp),
            title: Text("Manajemen Program Kerja"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProgramKerjaScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.account_box_sharp),
            title: Text("Manajemen Galeri Kegiatan"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => GaleriKegiatanScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.account_box_sharp),
            title: Text("Manajemen Struktur Organisasi"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => StrukturOrganisasiScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.logout_rounded),
            title: Text("Logout"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LogoutScreen()));
            },
          )
        ],
      ),
    );
  }
}
