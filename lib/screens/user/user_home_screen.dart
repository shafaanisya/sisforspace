// import 'package:flutter/material.dart';
// import 'absensi_user_screen.dart';
// import 'rekap_absensi_screen.dart';
// import 'logout_screen.dart';

// class UserHomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('User Home')),
//       body: ListView(
//         children: [
//           ListTile(
//             title: Text('Absensi Rapat'),
//             onTap: () => Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => AbsensiUserScreen()),
//             ),
//           ),
//           ListTile(
//             title: Text('Rekap Absensi Rapat'),
//             onTap: () => Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => RekapAbsensiScreen()),
//             ),
//           ),
//           ListTile(
//             title: Text('Logout'),
//             onTap: () => Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => LogoutScreen()),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Home')),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Absensi Rapat'),
            onTap: () {
              Navigator.pushNamed(context, '/absensi_user');
            },
          ),
          ListTile(
            title: const Text('Rekap Absensi'),
            onTap: () {
              Navigator.pushNamed(context, '/rekap_absensi');
            },
          ),
          ListTile(
            title: const Text('Logout'),
            onTap: () {
              Navigator.pushNamed(context, '/logout');
            },
          ),
        ],
      ),
    );
  }
}
