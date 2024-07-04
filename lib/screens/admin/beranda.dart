import 'package:flutter/material.dart';
import 'package:sisforspace/widgets/admin_homescreen.dart';

class Beranda extends StatelessWidget {
  const Beranda({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AdminHomeScreen(),
      appBar: AppBar(title: Text("Beranda")),
      body: Center(
        child: Text("Selamat Datang"),
      ),
    );
  }
}
