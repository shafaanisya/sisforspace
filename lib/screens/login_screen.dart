import 'package:flutter/material.dart';
import 'package:sisforspace/services/db_service.dart';
import '../screens/admin/beranda.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _dbService = DBService();

  Future<void> _login() async {
    final username = _usernameController.text;
    final password = _passwordController.text;

    final admin = await _dbService.getAdmin(username, password);

    if (admin != null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Beranda()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Username atau password salah')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Admin')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:sisforspace/services/db_service.dart';
// import '../screens/user/user_home_screen.dart';
// import '../screens/admin/beranda.dart';

// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final DBService _dbService = DBService();
//   String? _errorMessage;

//   Future<void> _login() async {
//     final username = _usernameController.text;
//     final password = _passwordController.text;

//     final admin = await _dbService.getAdmin(username, password);

//     if (admin != true) {
//       Navigator.pushReplacement(
//           context, MaterialPageRoute(builder: (context) => Beranda()));
//     } else if (username == 'user' && password == 'user') {
//       // Check for a hardcoded user
//       Navigator.pushReplacement(context,
//           MaterialPageRoute(builder: (context) => const UserHomeScreen()));
//     } else {
//       setState(() {
//         _errorMessage = 'Username atau password salah';
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Login')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: _usernameController,
//               decoration: InputDecoration(labelText: 'Username'),
//             ),
//             TextField(
//               controller: _passwordController,
//               decoration: InputDecoration(labelText: 'Password'),
//               obscureText: true,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _login,
//               child: Text('Login'),
//             ),
//             if (_errorMessage != null)
//               Padding(
//                 padding: const EdgeInsets.only(top: 20),
//                 child: Text(
//                   _errorMessage!,
//                   style: TextStyle(color: Colors.red),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:sisforspace/services/db_service.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);

//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final _dbService = DBService();

//   Future<void> _login() async {
//     final username = _usernameController.text;
//     final password = _passwordController.text;

//     final admin = await _dbService.getAdmin(username, password);

//     if (admin != null) {
//       Navigator.pushReplacementNamed(context, '/admin_home');
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Username atau password salah')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Login Admin')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _usernameController,
//               decoration: const InputDecoration(labelText: 'Username'),
//             ),
//             TextField(
//               controller: _passwordController,
//               decoration: const InputDecoration(labelText: 'Password'),
//               obscureText: true,
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _login,
//               child: const Text('Login'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
